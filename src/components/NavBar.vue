<template>
  <!-- Ubuntu/GNOME-style left dock, refined -->
  <aside
    class="fixed left-4 top-1/2 -translate-y-1/2 z-50
           flex flex-col items-center gap-3
           px-2 py-3 rounded-2xl
           bg-gray-900/60 backdrop-blur-xl border border-white/10 shadow-2xl
           sm:flex"
    aria-label="Section dock"
  >
    <!-- Main sections -->
    <ul class="flex flex-col items-center" role="tablist" aria-orientation="vertical">
      <li v-for="(s, i) in computedSections" :key="s.id" class="relative group">
        <a
          :href="'#' + s.id"
          :aria-label="s.name"
          :aria-current="activeSection === s.id ? 'page' : undefined"
          class="relative grid place-items-center w-12 h-12 rounded-xl
                 text-gray-200 hover:text-white
                 bg-white/5 hover:bg-white/10
                 transition-all duration-150 ease-out
                 hover:scale-[1.05] active:scale-95 focus:outline-none focus:ring-2 focus:ring-emerald-400/60"
          :class="activeSection === s.id ? 'ring-2 ring-emerald-400/60 bg-white/10' : ''"
          @click.prevent="scrollToSection(s.id)"
          @keydown.down.prevent="focusByIndex(i + 1)"
          @keydown.up.prevent="focusByIndex(i - 1)"
        >
          <!-- Replace with your SVGs if desired -->
          <component :is="s.icon ? 'span' : 'span'" class="text-xl select-none">
            {{ s.icon || '•' }}
          </component>
        </a>

        <!-- Active bar indicator -->
        <span
          class="absolute left-[-10px] top-1/2 -translate-y-1/2
                 w-1.5 rounded-full bg-emerald-400 transition-all"
          :class="activeSection === s.id ? 'h-6 opacity-100' : 'h-2 opacity-0 group-hover:opacity-40'"
        />

        <!-- Tooltip -->
        <div
          class="pointer-events-none absolute left-[70px] top-1/2 -translate-y-1/2
                 px-2 py-1 rounded-md text-xs font-medium whitespace-nowrap
                 bg-gray-900/95 text-white shadow-lg
                 opacity-0 translate-x-[-6px]
                 group-hover:opacity-100 group-hover:translate-x-0
                 transition-all duration-150"
        >
          {{ s.name }}
        </div>
      </li>
    </ul>

    <!-- Separator -->
    <div class="my-2 h-px w-9 bg-white/10"></div>

    <!-- Socials -->
    <div class="flex flex-col items-center gap-2">
      <a
        :href="linkedinUrl"
        target="_blank" rel="noopener noreferrer"
        class="w-12 h-12 grid place-items-center rounded-xl bg-white/5 hover:bg-white/10
               text-gray-200 hover:text-white transition-all hover:scale-[1.05] focus:outline-none focus:ring-2 focus:ring-emerald-400/60"
        aria-label="LinkedIn" title="LinkedIn"
      >
        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
          <path d="M4.98 3.5a2.5 2.5 0 1 1 0 5 2.5 2.5 0 0 1 0-5ZM3 8.98h3.96V21H3V8.98Zm7.49 0H14.3v1.64h.05c.45-.86 1.55-1.77 3.2-1.77 3.43 0 4.06 2.25 4.06 5.18V21H17.6v-5.09c0-1.21-.02-2.77-1.69-2.77-1.69 0-1.95 1.32-1.95 2.68V21h-3.47V8.98Z"/>
        </svg>
      </a>
      <a
        :href="githubUrl"
        target="_blank" rel="noopener noreferrer"
        class="w-12 h-12 grid place-items-center rounded-xl bg-white/5 hover:bg-white/10
               text-gray-200 hover:text-white transition-all hover:scale-[1.05] focus:outline-none focus:ring-2 focus:ring-emerald-400/60"
        aria-label="GitHub" title="GitHub"
      >
        <svg class="w-6 h-6" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
          <path d="M12 2a10 10 0 0 0-3.16 19.48c.5.09.68-.22.68-.48v-1.7c-2.78.61-3.37-1.17-3.37-1.17-.45-1.16-1.1-1.47-1.1-1.47-.9-.62.07-.61.07-.61 1 .07 1.52 1.03 1.52 1.03.9 1.52 2.37 1.08 2.95.83.09-.65.35-1.09.63-1.34-2.22-.25-4.55-1.11-4.55-4.95 0-1.09.39-1.98 1.03-2.68-.1-.25-.45-1.28.1-2.67 0 0 .84-.27 2.75 1.02a9.57 9.57 0 0 1 5 0C16 6.6 16.84 6.87 16.84 6.87c.55 1.39.2 2.42.1 2.67.64.7 1.03 1.59 1.03 2.68 0 3.85-2.34 4.7-4.57 4.95.36.31.68.92.68 1.86v2.76c0 .27.18.58.69.48A10 10 0 0 0 12 2Z"/>
        </svg>
      </a>
    </div>

    <!-- Mobile toggle (hidden by default, show via parent if needed) -->
  </aside>
</template>

<script setup>
import { onMounted, onBeforeUnmount, ref, computed, nextTick } from 'vue'

/**
 * Props
 * - sections: [{ id, name, icon? }]  (icons can be emoji or inline SVG via slots in your app)
 * - topOffset: pixels to offset when scrolling (e.g., your fixed top bar height)
 * - linkedinUrl/githubUrl: social links
 */
const props = defineProps({
  sections: {
    type: Array,
    default: () => ([
      { id: 'hero',     name: 'Home',     icon: '🏠' },
      { id: 'about',    name: 'About',    icon: '👤' },
      { id: 'projects', name: 'Projects', icon: '🧩' },
      { id: 'contact',  name: 'Contact',  icon: '✉️' },
    ])
  },
  topOffset: { type: Number, default: 48 },
  linkedinUrl: { type: String, default: 'https://www.linkedin.com/in/mengsrunnit' },
  githubUrl: { type: String, default: 'https://github.com/mengsrunnit' },
})

const computedSections = computed(() => props.sections.filter(Boolean))

// Active section (scrollspy)
const activeSection = ref(computedSections.value[0]?.id || '')

function scrollToSection(id) {
  const el = document.getElementById(id)
  if (!el) return
  const rect = el.getBoundingClientRect()
  const top = window.scrollY + rect.top - props.topOffset
  window.history.replaceState(null, '', `#${id}`)
  window.scrollTo({ top, behavior: 'smooth' })
}

let observer
const anchors = new Map()

onMounted(() => {
  // Observe each target section
  nextTick(() => {
    computedSections.value.forEach(s => {
      const el = document.getElementById(s.id)
      if (el) anchors.set(s.id, el)
    })

    observer = new IntersectionObserver((entries) => {
      // Pick the most visible section near the top
      const visible = entries
        .filter(e => e.isIntersecting)
        .sort((a, b) => a.boundingClientRect.top - b.boundingClientRect.top)
      if (visible[0]) {
        const id = visible[0].target.id
        activeSection.value = id
      }
    }, { rootMargin: `-${props.topOffset + 8}px 0px -60% 0px`, threshold: [0, 0.3, 0.6, 1] })

    anchors.forEach(el => observer.observe(el))

    // If page opened with a hash, ensure correct active state
    const hash = decodeURIComponent(window.location.hash.replace('#',''))
    if (hash && anchors.get(hash)) activeSection.value = hash
  })
})

onBeforeUnmount(() => {
  if (observer) observer.disconnect()
})

function focusByIndex(i) {
  const clamped = (i + computedSections.value.length) % computedSections.value.length
  const link = document.querySelectorAll('[aria-label][href^="#"]')[clamped]
  link?.focus()
}
</script>

<style scoped>
/* Extra glow on hover for a premium feel */
a:hover { box-shadow: 0 8px 30px rgba(16, 185, 129, 0.15); }
</style>
