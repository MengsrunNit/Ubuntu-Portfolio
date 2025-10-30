<template>
  <nav
    class="fixed top-0 left-0 right-0 z-50 backdrop-blur-lg shadow-md transition-all duration-300"
    :class="{
      'py-4': !scrolled,
      'py-2 shadow-emerald-500/10': scrolled,
      'bg-gray-900/70': isDarkTheme,
      'bg-blue-500/70': !isDarkTheme,
    }"
  >
    <!-- Progress bar indicator with better visibility -->
    <div
      class="absolute bottom-0 left-0 h-0.5 transition-all duration-150 ease-linear"
      :class="{ 'bg-emerald-400': isDarkTheme, 'bg-amber-400': !isDarkTheme }"
      :style="{ width: scrollProgress + '%' }"
    ></div>

    <div class="max-w-6xl mx-auto flex items-center justify-between px-4">
      <!-- Logo / Brand with subtle glow effect -->
      <a
        href="#home"
        class="text-white font-bold text-xl tracking-tight flex items-center py-2 relative group"
      >
        <span class="text-emerald-400 relative inline-block">
          <!-- Add subtle glow effect to logo -->
          <span
            class="absolute -inset-1 bg-emerald-500/20 rounded-full blur-lg opacity-0 group-hover:opacity-100 transition-opacity duration-500"
          ></span>
          <span class="relative">M</span>
        </span>
        <span>engsrun</span>
      </a>

      <!-- Desktop Navigation with improved visibility against moving background -->
      <div class="hidden md:flex items-center space-x-4 lg:space-x-8">
        <a
          v-for="(item, index) in navItems"
          :key="index"
          :href="item.href"
          class="text-gray-200 hover:text-emerald-400 transition-colors duration-200 text-sm relative py-2"
          :class="{
            'text-emerald-400': activeSection === item.href.substring(1),
          }"
        >
          {{ item.label }}
          <span
            class="absolute bottom-0 left-0 w-full h-0.5 bg-emerald-400 transform scale-x-0 transition-transform origin-left duration-300"
            :class="{ 'scale-x-100': activeSection === item.href.substring(1) }"
          ></span>
        </a>
        <!-- Theme Toggle Button -->
        <button
          @click="toggleTheme"
          class="text-gray-200 hover:text-emerald-400 transition-colors duration-200 p-2 rounded-full hover:bg-gray-800/50 flex items-center justify-center"
          aria-label="Toggle theme"
        >
          <!-- Moon icon for dark mode (shown when in light mode) -->
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
            ></path>
          </svg>
          <!-- Sun icon for light mode (shown when in dark mode) -->
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
            ></path>
          </svg>
        </button>
        <a
          href="#contact"
          class="px-4 py-2 bg-emerald-600 hover:bg-emerald-700 text-white rounded-md transition-colors duration-200 text-sm font-medium shadow-lg shadow-emerald-900/30"
          :class="{ 'bg-emerald-700': activeSection === 'contact' }"
        >
          Contact Me
        </a>
      </div>

      <!-- Mobile Menu Button -->
      <button
        @click="toggleMobileMenu"
        class="md:hidden text-gray-200 hover:text-white focus:outline-none p-2 rounded-md active:bg-gray-800/50"
        aria-label="Toggle menu"
      >
        <svg
          v-if="!mobileMenuOpen"
          class="w-6 h-6"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M4 6h16M4 12h16M4 18h16"
          />
        </svg>
        <svg
          v-else
          class="w-6 h-6"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M6 18L18 6M6 6l12 12"
          />
        </svg>
      </button>
    </div>

    <!-- Mobile Menu with glassmorphism effect -->
    <transition name="mobile-menu">
      <div
        v-if="mobileMenuOpen"
        class="md:hidden fixed top-[calc(var(--nav-height))] left-0 right-0 bottom-0 bg-gray-900/90 backdrop-blur-xl shadow-lg flex flex-col z-40 overscroll-contain"
        :style="{ '--nav-height': navHeight + 'px' }"
      >
        <div class="overflow-y-auto flex-grow p-4 pb-24">
          <a
            v-for="(item, index) in navItems"
            :key="index"
            :href="item.href"
            class="block text-gray-200 hover:text-emerald-400 transition-colors duration-200 py-4 px-4 mb-2 rounded-lg hover:bg-gray-800/50 active:bg-gray-800/70"
            :class="{
              'text-emerald-400 bg-gray-800/30':
                activeSection === item.href.substring(1),
            }"
            @click="closeMobileMenu"
          >
            <div class="flex items-center">
              <span class="text-lg font-medium">{{ item.label }}</span>
              <div
                class="ml-auto"
                v-if="activeSection === item.href.substring(1)"
              >
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path
                    fill-rule="evenodd"
                    d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                    clip-rule="evenodd"
                  ></path>
                </svg>
              </div>
            </div>
          </a>

          <div class="mt-6 px-4">
            <a
              href="#contact"
              class="block w-full py-4 bg-emerald-600 hover:bg-emerald-700 active:bg-emerald-800 text-white rounded-lg transition-colors duration-200 text-center text-lg font-medium shadow-lg shadow-emerald-900/30"
              :class="{ 'bg-emerald-700': activeSection === 'contact' }"
              @click="closeMobileMenu"
            >
              Contact Me
            </a>
          </div>

          <!-- Theme Toggle in Mobile Menu -->
          <div class="mt-6 px-4">
            <button
              @click="toggleTheme"
              class="flex items-center justify-center w-full py-4 bg-gray-800 hover:bg-gray-700 active:bg-gray-600 text-gray-200 rounded-lg transition-colors duration-200 text-center text-lg font-medium"
            >
              <span class="mr-2">Toggle Theme</span>
              <!-- Moon icon for dark mode (shown when in light mode) -->
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
                ></path>
              </svg>
              <!-- Sun icon for light mode (shown when in dark mode) -->
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
                ></path>
              </svg>
            </button>
          </div>

          <div class="mt-12 text-center text-gray-500 text-sm">
            <p>© 2023 Mengsrun Nit</p>
          </div>
        </div>
      </div>
    </transition>

    <!-- Overlay for background blur when mobile menu is open -->
    <transition name="fade">
      <div
        v-if="mobileMenuOpen"
        class="fixed inset-0 bg-black/50 backdrop-blur-sm md:hidden z-30"
        @click="closeMobileMenu"
      ></div>
    </transition>
  </nav>
</template>

<script setup>
// Keep the existing script code
import { ref, onMounted, onBeforeUnmount, computed } from "vue";

// Define props and emits
const props = defineProps({
  isDarkTheme: {
    type: Boolean,
    default: true,
  },
});

const emit = defineEmits(["theme-toggle"]);

const scrolled = ref(false);
const mobileMenuOpen = ref(false);
const activeSection = ref("home");
const scrollPosition = ref(0);
const documentHeight = ref(0);
const navHeight = ref(0);
const bodyElement = ref(null);

const navItems = [
  { label: "Home", href: "#home" },
  { label: "Skills", href: "#about" },
  { label: "Projects", href: "#projects" },
  { label: "Experience", href: "#experience" },
];

// Helper to get accurate document height
const getDocumentHeight = () =>
  Math.max(
    document.body.scrollHeight,
    document.body.offsetHeight,
    document.documentElement.clientHeight,
    document.documentElement.scrollHeight,
    document.documentElement.offsetHeight
  );

// Calculate scroll progress percentage, clamped to [0, 100]
const scrollProgress = computed(() => {
  const viewportHeight = window.innerHeight || 0;
  const maxScroll = Math.max(documentHeight.value - viewportHeight, 1); // avoid division by zero
  const raw = (scrollPosition.value / maxScroll) * 100;
  return Math.min(Math.max(raw, 0), 100);
});

const checkScroll = () => {
  scrolled.value = window.scrollY > 10;
  scrollPosition.value = window.scrollY;
  // Keep document height updated in case content changes dynamically
  documentHeight.value = getDocumentHeight();
  updateActiveSection();
};

const updateActiveSection = () => {
  // Get all section elements
  const sections = document.querySelectorAll('section[id], div[id="home"]');
  const navHeight = document.querySelector("nav").offsetHeight;

  // Find which section is currently in view
  for (const section of sections) {
    const sectionTop = section.offsetTop - navHeight - 50; // 50px buffer
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

// Handle clicks outside of mobile menu to close it
const handleClickOutside = (event) => {
  const nav = document.querySelector("nav");
  if (mobileMenuOpen.value && nav && !nav.contains(event.target)) {
    mobileMenuOpen.value = false;
  }
};

// Toggle mobile menu with body scroll lock
const toggleMobileMenu = () => {
  mobileMenuOpen.value = !mobileMenuOpen.value;

  if (mobileMenuOpen.value) {
    // Lock body scroll when menu is open
    document.body.style.overflow = "hidden";
    document.body.style.touchAction = "none";
  } else {
    // Restore scroll when menu is closed
    document.body.style.overflow = "";
    document.body.style.touchAction = "";
  }
};

// Close mobile menu and restore scroll
const closeMobileMenu = () => {
  mobileMenuOpen.value = false;
  document.body.style.overflow = "";
  document.body.style.touchAction = "";

  // Add a small delay to let the click event propagate
  // before the scrolling happens
  setTimeout(() => {
    setupSmoothScrolling();
  }, 50);
};

// Update measurement of nav height for positioning
const updateNavHeight = () => {
  const navElement = document.querySelector("nav");
  if (navElement) {
    navHeight.value = navElement.offsetHeight;
  }
};

// Handle window resize
const handleResize = () => {
  // Close mobile menu on resize to desktop
  if (window.innerWidth >= 768 && mobileMenuOpen.value) {
    closeMobileMenu();
  }

  // Update document height for scroll progress calculation
  documentHeight.value = getDocumentHeight();

  // Update nav height
  updateNavHeight();
};

// Enable smooth scrolling for anchor links
const setupSmoothScrolling = () => {
  document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener("click", function (e) {
      e.preventDefault();

      const targetId = this.getAttribute("href");
      const targetElement = document.querySelector(targetId);

      if (targetElement) {
        // Account for fixed navbar height
        const navbarHeight = document.querySelector("nav").offsetHeight;
        const targetPosition =
          targetElement.getBoundingClientRect().top +
          window.scrollY -
          navbarHeight;

        // Small delay for mobile menu close animation
        setTimeout(() => {
          window.scrollTo({
            top: targetPosition,
            behavior: "smooth",
          });
        }, 10);
      }
    });
  });
};

onMounted(() => {
  window.addEventListener("scroll", checkScroll);
  window.addEventListener("click", handleClickOutside);
  window.addEventListener("resize", handleResize);
  bodyElement.value = document.body;

  setupSmoothScrolling();
  checkScroll(); // Check initial scroll position
  handleResize(); // Initialize document height
  updateNavHeight(); // Initialize nav height

  // Set initial active section after a small delay to ensure sections are properly rendered
  setTimeout(updateActiveSection, 200);
});

// Theme toggle function
const toggleTheme = () => {
  // Emit event to parent component (App.vue)
  emit("theme-toggle", !props.isDarkTheme);

  // Save preference to localStorage
  localStorage.setItem(
    "portfolio-theme",
    !props.isDarkTheme ? "dark" : "light"
  );
};

// Apply current theme to document
const applyTheme = () => {
  // Removed since we're handling this at the App.vue level
};

// Watch for theme changes - removed since we're using props now

onBeforeUnmount(() => {
  window.removeEventListener("scroll", checkScroll);
  window.removeEventListener("click", handleClickOutside);
  window.removeEventListener("resize", handleResize);

  // Ensure we clean up any body modifications
  if (bodyElement.value) {
    bodyElement.value.style.overflow = "";
    bodyElement.value.style.touchAction = "";
  }
});
</script>

<style scoped>
nav {
  border-bottom: 1px solid rgba(16, 185, 129, 0.1);
  transform: translateZ(0); /* Fix for mobile browsers */
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
}

/* Mobile menu transitions */
.mobile-menu-enter-active,
.mobile-menu-leave-active {
  transition: transform 0.35s cubic-bezier(0.16, 1, 0.3, 1), opacity 0.35s ease;
}

.mobile-menu-enter-from,
.mobile-menu-leave-to {
  opacity: 0;
  transform: translateY(-8px);
}

/* Fade transition for overlay */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

/* Better touch experience on mobile */
@media (max-width: 767px) {
  /* Improved tap targets */
  nav a,
  nav button {
    min-height: 44px;
    display: flex;
    align-items: center;
  }

  /* Active state feedback */
  a:active {
    transform: scale(0.98);
  }

  /* Force hardware acceleration for smoother animations */
  .mobile-menu-enter-active,
  .mobile-menu-leave-active,
  .fade-enter-active,
  .fade-leave-active {
    will-change: opacity, transform;
    backface-visibility: hidden;
  }

  /* Enhanced scroll behavior */
  div.overflow-y-auto {
    scrollbar-width: thin;
    scrollbar-color: rgba(16, 185, 129, 0.5) rgba(17, 24, 39, 0.3);
    -webkit-overflow-scrolling: touch;
  }

  /* Custom scrollbar styling */
  div.overflow-y-auto::-webkit-scrollbar {
    width: 4px;
  }

  div.overflow-y-auto::-webkit-scrollbar-track {
    background: rgba(17, 24, 39, 0.3);
    border-radius: 4px;
  }

  div.overflow-y-auto::-webkit-scrollbar-thumb {
    background-color: rgba(16, 185, 129, 0.5);
    border-radius: 4px;
  }
}

/* Safer iOS overscroll */
.overscroll-contain {
  overscroll-behavior: contain;
  -webkit-overflow-scrolling: touch;
}

/* Add subtle hover glow effects */
nav a:hover {
  text-shadow: 0 0 8px rgba(16, 185, 129, 0.5);
}
</style>
