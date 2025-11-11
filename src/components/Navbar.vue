<template>
  <nav
    class="fixed top-0 left-0 right-0 z-[60] px-3 sm:px-4 transition-all duration-300"
    :class="{
      'py-3 sm:py-4': !scrolled,
      'py-1.5 sm:py-2': scrolled,
    }"
    role="navigation"
    aria-label="Primary"
    ref="topNavRef"
  >
    <!-- Progress bar indicator -->
    <div
      class="absolute bottom-0 left-0 h-0.5 transition-all duration-150 ease-linear"
      :class="{ 'bg-emerald-400': isDarkTheme, 'bg-amber-400': !isDarkTheme }"
      :style="{ width: scrollProgress + '%' }"
      aria-hidden="true"
    ></div>

    <div
      class="nav-shell max-w-7xl mx-auto flex items-center justify-center lg:justify-between px-3 sm:px-4 lg:px-6 rounded-2xl border transition-all duration-300 backdrop-blur-lg"
      :class="[
        scrolled ? 'shadow-lg' : 'shadow-md',
        isDarkTheme
          ? 'bg-gray-900/80 border-gray-800/70 shadow-emerald-500/10'
          : 'bg-white/80 border-white/70 shadow-blue-500/10',
      ]"
    >
      <!-- Logo / Brand -->
      <a
        href="#home"
        class="font-bold tracking-tight flex items-center py-2 relative group focus:outline-none focus-visible:ring-2 focus-visible:ring-emerald-400 rounded-lg transition-all"
        :class="[
          scrolled ? 'text-lg sm:text-xl' : 'text-xl sm:text-2xl',
          isDarkTheme ? 'text-white' : 'text-slate-900'
        ]"
      >
        <span class="text-emerald-400 relative inline-block">
          <span
            class="absolute -inset-1 bg-emerald-500/20 rounded-full blur-lg opacity-0 group-hover:opacity-100 transition-opacity duration-500"
            aria-hidden="true"
          ></span>
          <span class="relative">M</span>
        </span>
        <span>engsrun</span>
      </a>

      <!-- Desktop Navigation (large screens) -->
      <div class="hidden lg:flex items-center space-x-6 xl:space-x-8">
        <a
          v-for="(item, index) in navItems"
          :key="index"
          :href="item.href"
          class="transition-all duration-200 relative py-2 px-2 focus:outline-none focus-visible:ring-2 focus-visible:ring-emerald-400 rounded-md"
          :class="[
            activeSection === item.href.substring(1)
              ? 'text-emerald-500 font-medium'
              : isDarkTheme
              ? 'text-gray-200 hover:text-emerald-400'
              : 'text-gray-700 hover:text-emerald-600',
            scrolled ? 'text-sm' : 'text-base'
          ]"
        >
          {{ item.label }}
          <span
            class="absolute bottom-0 left-0 w-full h-0.5 bg-emerald-400 transform scale-x-0 transition-transform origin-left duration-300"
            :class="{ 'scale-x-100': activeSection === item.href.substring(1) }"
            aria-hidden="true"
          ></span>
        </a>

        <!-- Theme Toggle - Desktop -->
        <button
          @click="toggleTheme"
          class="transition-colors duration-200 p-2 rounded-full flex items-center justify-center focus:outline-none focus-visible:ring-2 focus-visible:ring-emerald-400"
          :class="
            isDarkTheme
              ? 'text-gray-200 hover:text-emerald-400 hover:bg-gray-800/50'
              : 'text-slate-700 hover:text-emerald-600 hover:bg-slate-100'
          "
          aria-label="Toggle theme"
        >
          <svg
            v-if="!isDarkTheme"
            class="w-5 h-5"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"
            />
          </svg>
          <svg
            v-else
            class="w-5 h-5"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"
            />
          </svg>
        </button>

        <a
          href="#contact"
          class="px-4 xl:px-6 py-2 bg-emerald-600 hover:bg-emerald-700 text-white rounded-md transition-all duration-200 font-medium shadow-lg shadow-emerald-900/30 hover:shadow-emerald-900/50 hover:scale-105"
          :class="{
            'bg-emerald-700': activeSection === 'contact',
            'text-sm': scrolled,
            'text-base': !scrolled,
          }"
        >
          Contact Me
        </a>
      </div>

      <!-- Tablet Navigation (md to lg) -->
      <div class="hidden md:flex lg:hidden items-center space-x-4">
        <a
          v-for="(item, index) in navItems.slice(0, 3)"
          :key="index"
          :href="item.href"
          class="text-gray-200 hover:text-emerald-400 transition-colors duration-200 text-sm relative py-2 px-1 focus:outline-none focus-visible:ring-2 focus-visible:ring-emerald-400 rounded-md"
          :class="{
            'text-emerald-400 font-medium':
              activeSection === item.href.substring(1),
          }"
        >
          {{ item.label }}
        </a>

        <button
          @click="toggleMobileMenu"
          class="text-gray-200 hover:text-white focus:outline-none p-2 rounded-md hover:bg-gray-800/50 focus-visible:ring-2 focus-visible:ring-emerald-400"
          aria-label="More menu"
        >
          <svg
            class="w-5 h-5"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"
            />
          </svg>
        </button>
      </div>

      <!-- Mobile hamburger removed per request (hide on small screens). -->
    </div>

    <!-- Mobile/Tablet Menu Overlay -->
  
    <transition name="fade">
      <div
        v-show="mobileMenuOpen && isDarkTheme"
        class="fixed inset-0 z-40 lg:hidden"
        :class="[
          isDarkTheme
            ? 'bg-black/50'       // darker overlay
            : 'bg-black/40',      // subtle dark overlay for light theme
        ]"
        @click.self="closeMobileMenu"
      ></div>
    </transition>

    <!-- Mobile/Tablet Menu Panel -->
    <transition name="slide-down">
      <div
        v-show="mobileMenuOpen && isDarkTheme"
        class="fixed top-[56px] left-0 right-0 lg:hidden z-50"
      >
        <div class="flex justify-center px-4">
          <div
            class="mobile-menu-panel"
            :class="[
              isDarkTheme
                ? 'bg-gray-900 border border-gray-800'
                : 'bg-white border border-gray-200',
              'rounded-b-2xl shadow-2xl'
            ]"
          >
            <div
              class="max-h-[calc(100vh-80px)] overflow-y-auto overscroll-contain"
            >
              <div class="p-4 space-y-2">
                <!-- Menu Items -->
                <a
                  v-for="(item, index) in navItems"
                  :key="index"
                  :href="item.href"
                  @click="navigateTo(item.href)"
                  class="block px-4 py-3 rounded-lg transition-all duration-200"
                  :class="[
                    activeSection === item.href.substring(1)
                      ? 'bg-emerald-500/20 text-emerald-400 font-semibold'
                      : isDarkTheme
                      ? 'text-gray-200 hover:bg-gray-800/50 hover:text-emerald-400'
                      : 'text-gray-700 hover:bg-gray-100 hover:text-emerald-600',
                  ]"
                >
                  <div class="flex items-center justify-between">
                    <span class="text-base">{{ item.label }}</span>
                    <svg
                      v-if="activeSection === item.href.substring(1)"
                      class="w-5 h-5"
                      fill="currentColor"
                      viewBox="0 0 20 20"
                    >
                      <path
                        fill-rule="evenodd"
                        d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                        clip-rule="evenodd"
                      />
                    </svg>
                  </div>
                </a>

                <!-- Contact Button -->
                <a
                  href="#contact"
                  @click="navigateTo('#contact')"
                  class="block w-full py-3 px-4 bg-emerald-600 hover:bg-emerald-700 active:bg-emerald-800 text-white rounded-lg transition-all duration-200 text-center font-medium shadow-lg mt-4"
                >
                  Contact Me
                </a>

                <!-- Theme Toggle -->
                <button
                  @click="toggleTheme"
                  class="flex items-center justify-center w-full py-3 px-4 rounded-lg transition-all duration-200 mt-2"
                  :class="[
                    isDarkTheme
                      ? 'bg-gray-800 hover:bg-gray-700 text-gray-200'
                      : 'bg-gray-200 hover:bg-gray-300 text-gray-700',
                  ]"
                >
                  <span class="mr-2">Toggle Theme</span>
                  <svg
                    v-if="!isDarkTheme"
                    class="w-5 h-5"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"
                    />
                  </svg>
                  <svg
                    v-else
                    class="w-5 h-5"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"
                    />
                  </svg>
                </button>
              </div>

              <!-- Footer -->
              <div
                class="px-4 py-4 text-center text-xs opacity-60 border-t"
                :class="
                  isDarkTheme
                    ? 'text-gray-400 border-gray-800'
                    : 'text-gray-600 border-gray-200'
                "
              >
                <p>© 2025 Mengsrun Nit</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </nav>

  <!-- Bottom Mobile Navigation Bar -->
  <div
    class="lg:hidden fixed left-0 right-0 z-[55] transition-all ease-out duration-200"
    :class="[
      bottomBarHidden ? 'translate-y-full' : 'translate-y-0',
      isDarkTheme ? 'bg-gray-900/95' : 'bg-white/95',
      'backdrop-blur-lg shadow-[0_-4px_20px_rgba(0,0,0,0.25)]',
    ]"
    :style="{ bottom: '0' }"
  >
    <div class="max-w-6xl mx-auto">
      <ul class="grid grid-cols-5 text-xs sm:text-sm">
        <li v-for="item in bottomNavItems" :key="item.href">
          <button
            @click="navigateTo(item.href)"
            class="w-full flex flex-col items-center justify-center py-2 sm:py-2.5 gap-0.5 sm:gap-1 focus:outline-none focus-visible:ring-2 focus-visible:ring-emerald-400 rounded-lg transition-all active:scale-95"
            :class="[
              activeSection === item.href.substring(1)
                ? 'text-emerald-400 font-semibold'
                : isDarkTheme
                ? 'text-gray-400 hover:text-gray-200'
                : 'text-gray-600 hover:text-gray-900',
            ]"
          >
            <span
              class="inline-block transition-transform"
              :class="
                activeSection === item.href.substring(1) ? 'scale-110' : ''
              "
              v-html="item.icon"
            ></span>
            <span class="font-medium">{{ item.label }}</span>
          </button>
        </li>
      </ul>
      <div class="h-[env(safe-area-inset-bottom)]"></div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount, computed, watch } from "vue";

const props = defineProps({
  isDarkTheme: { type: Boolean, default: true },
});
const emit = defineEmits(["theme-toggle"]);

const scrolled = ref(false);
const mobileMenuOpen = ref(false);
const activeSection = ref("home");
const scrollPosition = ref(0);
const documentHeight = ref(0);
const navHeight = ref(0);
const topNavRef = ref(null);
const bottomBarHidden = ref(false);
// Keep track of previous (desktop) theme so we can restore it after mobile
const prevDesktopTheme = ref(null);

const navItems = [
  { label: "Home", href: "#home" },
  { label: "Skills", href: "#about" },
  { label: "Projects", href: "#projects" },
  { label: "Experience", href: "#experience" },
];

const bottomNavItems = [...navItems, { label: "Contact", href: "#contact" }];

const icons = {
  Home: '<svg class="w-5 h-5 sm:w-6 sm:h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 10.5L12 3l9 7.5"/><path d="M5 10v10h14V10"/></svg>',
  Skills:
    '<svg class="w-5 h-5 sm:w-6 sm:h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 00.33 1.82l.06.06a2 2 0 01-2.83 2.83l-.06-.06a1.65 1.65 0 00-1.82-.33 1.65 1.65 0 00-1 1.51V21a2 2 0 01-4 0v-.09a1.65 1.65 0 00-1-1.51 1.65 1.65 0 00-1.82.33l-.06.06a2 2 0 01-2.83-2.83l.06-.06A1.65 1.65 0 004.6 15a1.65 1.65 0 00-1.51-1H3a2 2 0 010-4h.09a1.65 1.65 0 001.51-1 1.65 1.65 0 00-.33-1.82l-.06-.06a2 2 0 012.83-2.83l.06.06A1.65 1.65 0 008.6 4.6a1.65 1.65 0 001-1.51V3a2 2 0 014 0v.09a1.65 1.65 0 001 1.51 1.65 1.65 0 001.82-.33l.06-.06a2 2 0 012.83 2.83l-.06.06A1.65 1.65 0 0019.4 9.4 1.65 1.65 0 0020.91 10H21a2 2 0 010 4h-.09a1.65 1.65 0 00-1.51 1z"/></svg>',
  Projects:
    '<svg class="w-5 h-5 sm:w-6 sm:h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>',
  Experience:
    '<svg class="w-5 h-5 sm:w-6 sm:h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 7h18"/><path d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V7"/><path d="M16 7V5a4 4 0 00-8 0v2"/></svg>',
  Contact:
    '<svg class="w-5 h-5 sm:w-6 sm:h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z"/></svg>',
};

bottomNavItems.forEach((i) => {
  i.icon = icons[i.label] || icons.Home;
});

const getDocumentHeight = () =>
  Math.max(
    document.body.scrollHeight,
    document.body.offsetHeight,
    document.documentElement.clientHeight,
    document.documentElement.scrollHeight,
    document.documentElement.offsetHeight
  );

const scrollProgress = computed(() => {
  const viewportHeight = window.innerHeight || 0;
  const maxScroll = Math.max(documentHeight.value - viewportHeight, 1);
  const raw = (scrollPosition.value / maxScroll) * 100;
  return Math.min(Math.max(raw, 0), 100);
});

let lastY = 0;

const checkScroll = () => {
  scrolled.value = window.scrollY > 10;
  scrollPosition.value = window.scrollY;
  documentHeight.value = getDocumentHeight();
  updateActiveSection();

  const currentY = window.scrollY;
  const scrollingDown = currentY > lastY;
  const scrollThreshold = 60;

  if (window.innerWidth < 1024) {
    bottomBarHidden.value =
      scrollingDown && currentY > scrollThreshold && !mobileMenuOpen.value;
  }
  lastY = currentY;
};

const updateActiveSection = () => {
  const sections = document.querySelectorAll('section[id], div[id="home"]');
  const navHeightPx = topNavRef.value?.offsetHeight || 0;
  for (const section of sections) {
    const sectionTop = section.offsetTop - navHeightPx - 50;
    const sectionHeight = section.offsetHeight;
    if (
      scrollPosition.value >= sectionTop &&
      scrollPosition.value < sectionTop + sectionHeight
    ) {
      activeSection.value = section.id;
      break;
    }
  }
};

const toggleMobileMenu = () => {
  // Mobile menu is available only in dark mode. If not dark, ignore the toggle.
  if (!props.isDarkTheme) {
    // Ensure menu is closed in case it was open
    mobileMenuOpen.value = false;
    document.body.style.overflow = "";
    bottomBarHidden.value = false;
    return;
  }

  mobileMenuOpen.value = !mobileMenuOpen.value;

  if (mobileMenuOpen.value) {
    document.body.style.overflow = "hidden";
    bottomBarHidden.value = true;
  } else {
    document.body.style.overflow = "";
  }
};

// Watch theme changes: if theme switches to light while mobile menu is open, close it.
watch(
  () => props.isDarkTheme,
  (isDark) => {
    if (!isDark && mobileMenuOpen.value) {
      closeMobileMenu();
    }
  }
);

const closeMobileMenu = () => {
  mobileMenuOpen.value = false;
  document.body.style.overflow = "";
};

const navigateTo = (href) => {
  closeMobileMenu();

  const targetElement = document.querySelector(href);
  if (targetElement) {
    const navbarHeight = topNavRef.value?.offsetHeight || 0;
    const offset = navbarHeight + 10;
    const targetPosition =
      targetElement.getBoundingClientRect().top + window.scrollY - offset;

    setTimeout(() => {
      window.scrollTo({ top: targetPosition, behavior: "smooth" });
    }, 50);
  }
};

const updateNavHeight = () => {
  if (topNavRef.value) {
    navHeight.value = topNavRef.value.offsetHeight;
  }
};

const handleResize = () => {
  // Close the mobile menu when switching to desktop (existing behavior)
  if (window.innerWidth >= 1024 && mobileMenuOpen.value) {
    closeMobileMenu();
  }

  // Also ensure the mobile menu is closed when switching to small screens
  // so it cannot remain open when the hamburger (mobile) control is removed.
  if (window.innerWidth < 768 && mobileMenuOpen.value) {
    closeMobileMenu();
  }

  // Automatic theme behavior:
  // - When entering mobile (<768px) and theme is light, force dark and remember previous.
  // - When leaving mobile (>=768px) and we previously forced a desktop theme, restore it.
  try {
    const isMobile = window.innerWidth < 768;
    if (isMobile) {
      if (props.isDarkTheme === false) {
        // remember previous desktop theme and switch to dark for mobile
        prevDesktopTheme.value = false;
        emit("theme-toggle", true);
        localStorage.setItem("portfolio-theme", "dark");
      }
    } else {
      // leaving mobile
      if (prevDesktopTheme.value !== null) {
        // restore previously remembered theme
        emit("theme-toggle", prevDesktopTheme.value);
        localStorage.setItem(
          "portfolio-theme",
          prevDesktopTheme.value ? "dark" : "light"
        );
        prevDesktopTheme.value = null;
      }
    }
  } catch (e) {
    // ignore for SSR or unexpected window errors
  }

  documentHeight.value = getDocumentHeight();
  updateNavHeight();
};

const toggleTheme = () => {
  emit("theme-toggle", !props.isDarkTheme);
  localStorage.setItem(
    "portfolio-theme",
    !props.isDarkTheme ? "dark" : "light"
  );
};

const setupSmoothScrolling = () => {
  document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener("click", function (e) {
      e.preventDefault();
      const href = this.getAttribute("href");
      navigateTo(href);
    });
  });
};

onMounted(() => {
  window.addEventListener("scroll", checkScroll, { passive: true });
  window.addEventListener("resize", handleResize);

  setupSmoothScrolling();
  checkScroll();
  handleResize();
  updateNavHeight();

  setTimeout(updateActiveSection, 200);
});

onBeforeUnmount(() => {
  window.removeEventListener("scroll", checkScroll);
  window.removeEventListener("resize", handleResize);
  document.body.style.overflow = "";
});
</script>

<style scoped>
.nav-shell {
  border-bottom: 1px solid rgba(16, 185, 129, 0.1);
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
}

/* Slide down animation for mobile menu */
.slide-down-enter-active,
.slide-down-leave-active {
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.slide-down-enter-from,
.slide-down-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}

/* Fade for overlay */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

/* Touch feedback */
@media (max-width: 1023px) {
  button:active,
  a:active {
    transform: scale(0.97);
  }
}

/* Scrollbar styling */
.overflow-y-auto {
  scrollbar-width: thin;
  scrollbar-color: rgba(16, 185, 129, 0.5) transparent;
}

.overflow-y-auto::-webkit-scrollbar {
  width: 6px;
}

.overflow-y-auto::-webkit-scrollbar-thumb {
  background-color: rgba(16, 185, 129, 0.5);
  border-radius: 3px;
}

/* Hover effects on desktop */
@media (min-width: 1024px) {
  nav a:hover {
    text-shadow: 0 0 8px rgba(16, 185, 129, 0.5);
  }
}

/* FINAL FIX: Account for global app padding and ensure consistent width */
.mobile-menu-panel {
  box-sizing: border-box;
  /* This accounts for your global #app padding: 2rem and ensures consistent width */
  width: calc(100vw - 2rem) !important; /* Subtract the app container padding */
  max-width: 360px !important;
  margin: 0 !important;
  padding: 0 !important;
  font-size: 1rem !important;
  line-height: 1.2 !important;
}

/* Responsive adjustments */
@media (min-width: 640px) {
  .mobile-menu-panel {
    width: 400px !important;
    max-width: calc(100vw - 2rem) !important;
  }
}

@media (min-width: 768px) {
  .mobile-menu-panel {
    width: 480px !important;
    max-width: calc(100vw - 3rem) !important;
  }
}

/* Ensure no theme-specific width conflicts */
.mobile-menu-panel.bg-white,
.mobile-menu-panel.bg-gray-900 {
  width: calc(100vw - 2rem) !important;
  max-width: 360px !important;
}

@media (min-width: 640px) {
  .mobile-menu-panel.bg-white,
  .mobile-menu-panel.bg-gray-900 {
    width: 400px !important;
    max-width: calc(100vw - 2rem) !important;
  }
}

@media (min-width: 768px) {
  .mobile-menu-panel.bg-white,
  .mobile-menu-panel.bg-gray-900 {
    width: 480px !important;
    max-width: calc(100vw - 3rem) !important;
  }
}
</style>