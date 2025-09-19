<template>
  <!-- GNOME-style Top Bar -->
  <header
    class="fixed top-0 inset-x-0 z-40 h-10 bg-black/60 backdrop-blur-md border-b border-white/10 flex items-center select-none"
    role="banner"
  >
    <!-- Left: Activities -->
    <div class="flex items-center gap-2 px-3">
      <button
        class="px-2 py-1 rounded-md text-sm font-semibold text-gray-100 hover:bg-white/10 focus:outline-none focus:ring-2 focus:ring-emerald-400/60"
        @click="toggleApps"
        aria-haspopup="true"
        :aria-expanded="appsOpen ? 'true' : 'false'"
      >
        Activities
      </button>
    </div>

    <!-- Center: Clock -->
    <div class="absolute left-1/2 transform -translate-x-1/2">
      <button
        class="px-2 py-1 rounded-md text-sm font-semibold text-gray-100 hover:bg-white/10 focus:outline-none focus:ring-2 focus:ring-emerald-400/60"
        @click="toggleCalendar"
        aria-haspopup="true"
        :aria-expanded="calendarOpen ? 'true' : 'false'"
      >
        {{ formatted }}
      </button>
    </div>

    <!-- Right: System Tray -->
    <div class="ml-auto flex items-center gap-2 pr-3">
      <!-- Network -->
      <div class="relative">
        <button
          class="px-1.5 py-1 rounded-md hover:bg-white/10 focus:outline-none focus:ring-2 focus:ring-emerald-400/60"
          @click="toggleTray('net')"
          aria-label="Network"
          :aria-expanded="trayOpen === 'net' ? 'true' : 'false'"
        >
          <WifiIcon class="w-6 h-6 text-gray-100" />
        </button>
        <Panel v-if="trayOpen === 'net'" @close="trayOpen = ''" class="w-72">
          <div class="flex items-center justify-between">
            <span class="text-sm font-medium">Wi‑Fi</span>
            <span class="text-xs text-gray-400">{{ wifiConnected ? 'Connected' : 'Disconnected' }}</span>
          </div>
          <div class="mt-3 space-y-3">
            <label class="flex items-center justify-between text-sm">
              <span>Enable Wi‑Fi</span>
              <input type="checkbox" v-model="wifiEnabled" class="accent-emerald-500" />
            </label>
            <div v-if="wifiEnabled" class="space-y-1.5">
              <button
                v-for="n in networks" :key="n.ssid"
                class="w-full text-left px-2 py-1.5 rounded-md hover:bg-white/10"
                @click="connectNetwork(n)"
              >
                <div class="flex items-center justify-between">
                  <span class="text-sm">{{ n.ssid }}</span>
                  <span class="text-xs text-gray-400">{{ n.strength }}%</span>
                </div>
              </button>
            </div>
          </div>
        </Panel>
      </div>

      <!-- Bluetooth -->
      <div class="relative">
        <button
          class="px-1.5 py-1 rounded-md hover:bg-white/10 focus:outline-none focus:ring-2 focus:ring-emerald-400/60"
          @click="toggleTray('bt')"
          aria-label="Bluetooth"
          :aria-expanded="trayOpen === 'bt' ? 'true' : 'false'"
        >
          <BluetoothIcon class="w-6 h-6 text-gray-100" />
        </button>
        <Panel v-if="trayOpen === 'bt'" @close="trayOpen = ''" class="w-72">
          <div class="flex items-center justify-between">
            <span class="text-sm font-medium">Bluetooth</span>
            <label class="flex items-center gap-2 text-sm">
              <span class="text-gray-400">{{ btEnabled ? 'On' : 'Off' }}</span>
              <input type="checkbox" v-model="btEnabled" class="accent-emerald-500" />
            </label>
          </div>
          <div v-if="btEnabled" class="mt-2 space-y-1.5">
            <div
              v-for="d in btDevices"
              :key="d.name"
              class="flex items-center justify-between px-2 py-1.5 rounded-md hover:bg-white/10"
            >
              <span class="text-sm">{{ d.name }}</span>
              <button class="text-xs px-2 py-0.5 rounded-md bg-emerald-500/20 hover:bg-emerald-500/30">
                Connect
              </button>
            </div>
          </div>
        </Panel>
      </div>

      <!-- Volume -->
      <div class="relative">
        <button
          class="px-1.5 py-1 rounded-md hover:bg-white/10 focus:outline-none focus:ring-2 focus:ring-emerald-400/60"
          @click="toggleTray('vol')"
          aria-label="Sound"
          :aria-expanded="trayOpen === 'vol' ? 'true' : 'false'"
        >
          <VolumeIcon class="w-6 h-6 text-gray-100" :muted="volume === 0" />
        </button>
        <Panel v-if="trayOpen === 'vol'" @close="trayOpen = ''" class="w-64">
          <label class="text-sm font-medium">Volume</label>
          <input type="range" v-model="volume" min="0" max="100" class="w-full accent-emerald-500" />
          <div class="mt-2 flex items-center justify-between text-xs text-gray-400">
            <span>{{ volume }}%</span><span>Output: Speakers</span>
          </div>
        </Panel>
      </div>

      <!-- Battery -->
      <div class="relative">
        <button
          class="px-1.5 py-1 rounded-md hover:bg-white/10 focus:outline-none focus:ring-2 focus:ring-emerald-400/60"
          @click="toggleTray('bat')"
          aria-label="Battery"
          :aria-expanded="trayOpen === 'bat' ? 'true' : 'false'"
        >
          <BatteryIcon class="w-6 h-6 text-gray-100" :level="battery" :charging="charging" />
        </button>
        <Panel v-if="trayOpen === 'bat'" @close="trayOpen = ''" class="w-64">
          <div class="flex items-center justify-between">
            <span class="text-sm font-medium">Battery</span>
            <span class="text-sm">{{ battery }}%</span>
          </div>
          <p class="mt-1 text-xs text-gray-400">Status: {{ charging ? 'Charging' : 'Discharging' }}</p>
          <button class="mt-2 w-full text-sm px-2 py-1.5 rounded-md bg-white/10 hover:bg-white/15">Power Settings</button>
        </Panel>
      </div>
    </div>

    <!-- Apps popover -->
    <Panel v-if="appsOpen" @close="appsOpen = false" class="w-80 left-2 top-12 absolute">
      <div class="grid grid-cols-4 gap-3">
        <button v-for="s in quickLaunch" :key="s.id" class="p-3 rounded-lg bg-white/5 hover:bg-white/10 text-sm">
          {{ s.name }}
        </button>
      </div>
    </Panel>

    <!-- Calendar popover -->
    <Panel v-if="calendarOpen" @close="calendarOpen = false" class="w-80 left-1/2 -translate-x-1/2 top-12 absolute">
      <div class="text-sm">
        <div class="font-medium">{{ longDate }}</div>
        <div class="mt-2 h-px bg-white/10"></div>
        <p class="mt-2 text-gray-300">Calendar widget placeholder</p>
      </div>
    </Panel>
  </header>

  <!-- Spacer so content doesn’t hide behind the bar -->
  <div class="h-10"></div>
</template>

<script setup>
import { computed, onMounted, onBeforeUnmount, ref } from 'vue'

/* ---- Clock ---- */
const now = ref(new Date())
let t
onMounted(() => { t = setInterval(() => (now.value = new Date()), 1000) })
onBeforeUnmount(() => clearInterval(t))

const formatted = computed(() =>
  now.value.toLocaleString(undefined, {
    weekday: 'short', month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit',
  })
)
const longDate = computed(() =>
  now.value.toLocaleString(undefined, {
    weekday: 'long', year: 'numeric', month: 'long', day: 'numeric',
    hour: '2-digit', minute: '2-digit', second: '2-digit'
  })
)

/* ---- System states (mocked; wire to real APIs later) ---- */
const wifiEnabled = ref(true)
const wifiConnected = ref(true)
const networks = ref([
  { ssid: 'Home‑WiFi', strength: 92 },
  { ssid: 'Office‑5G', strength: 81 },
  { ssid: 'Cafe‑Guest', strength: 54 },
])
function connectNetwork(n) { wifiConnected.value = true }

const btEnabled = ref(true)
const btDevices = ref([{ name: 'MX Master 3S' }, { name: 'AirPods Pro' }])

const volume = ref(72)
const battery = ref(68)
const charging = ref(false)

/* ---- Popovers ---- */
const trayOpen = ref('') // 'net' | 'bt' | 'vol' | 'bat' | ''
function toggleTray(which) { trayOpen.value = trayOpen.value === which ? '' : which; appsOpen.value = false; calendarOpen.value = false }
const appsOpen = ref(false)
const calendarOpen = ref(false)
function toggleApps() { appsOpen.value = !appsOpen.value; calendarOpen.value = false; trayOpen.value = '' }
function toggleCalendar() { calendarOpen.value = !calendarOpen.value; appsOpen.value = false; trayOpen.value = '' }

/* Quick launch demo */
const quickLaunch = ref([
  { id: 'home', name: 'Home' },
  { id: 'about', name: 'About' },
  { id: 'projects', name: 'Projects' },
  { id: 'contact', name: 'Contact' },
])
</script>

<script>
// Reusable small components in Options API export for SFC convenience
export default {
  components: {
    Panel: {
      props: { class: String },
      emits: ['close'],
      template: `
        <div class="absolute z-50 mt-1 p-3 rounded-lg bg-gray-900/95 backdrop-blur-xl border border-white/10 shadow-xl"
             :class="class" @keydown.esc="$emit('close')">
          <slot />
        </div>
      `,
      mounted() {
        const onDocClick = (e) => { if (!this.$el.contains(e.target)) this.$emit('close') }
        document.addEventListener('mousedown', onDocClick)
        this._off = () => document.removeEventListener('mousedown', onDocClick)
      },
      unmounted() { this._off?.() }
    },
    WifiIcon: {
      props: { class: String },
      template: `
        <svg :class="class" viewBox="0 0 24 24" fill="none" aria-hidden="true">
          <path d="M2 8.5a16 16 0 0 1 20 0" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"/>
          <path d="M5 11.5a11 11 0 0 1 14 0" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"/>
          <path d="M8.5 14.5a6 6 0 0 1 7 0" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"/>
          <circle cx="12" cy="18" r="1.5" fill="currentColor"/>
        </svg>`
    },
    BluetoothIcon: {
      props: { class: String },
      template: `
        <svg :class="class" viewBox="0 0 24 24" fill="none" aria-hidden="true">
          <path d="M12 3v18l6-6-6-6 6-6-6 6-6-6" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>`
    },
    VolumeIcon: {
      props: { class: String, muted: Boolean },
      template: `
        <svg :class="class" viewBox="0 0 24 24" fill="none" aria-hidden="true">
          <path d="M4 10v4h3l5 4V6l-5 4H4z" fill="currentColor"/>
          <template v-if="!muted">
            <path d="M16 9a4 4 0 0 1 0 6" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"/>
            <path d="M18.5 7a7 7 0 0 1 0 10" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"/>
          </template>
          <template v-else>
            <path d="M19 5L9 15" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"/>
          </template>
        </svg>`
    },
    BatteryIcon: {
      props: { class: String, level: Number, charging: Boolean },
      computed: {
        fillWidth() { return Math.max(0, Math.min(100, this.level)) }
      },
      template: `
        <svg :class="class" viewBox="0 0 28 14" fill="none" aria-hidden="true">
          <rect x="1" y="2" width="22" height="10" rx="2" stroke="currentColor" stroke-width="1.6"/>
          <rect x="24" y="5" width="3" height="4" rx="1" fill="currentColor"/>
          <rect x="3" y="4" :width="(this.fillWidth/100)*18" height="6" rx="1" fill="currentColor"/>
          <path v-if="charging" d="M12 4l-2 3h2l-2 3 4-4h-2l2-2z" fill="#22c55e"/>
        </svg>`
    }
  }
}
</script>

<style scoped>
/***** Optional: Improve focus ring visibility on dark bg *****/
:focus-visible { outline: none; }
button:focus-visible { box-shadow: 0 0 0 2px rgb(16 185 129 / 0.6); border-radius: 0.5rem; }
</style>
