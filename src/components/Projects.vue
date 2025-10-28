<template>
  <section id="projects" class="py-20 px-4 md:px-8 bg-gray-900 text-gray-100">
    <div class="max-w-6xl mx-auto">
      <!-- Updated Header (matches Experience section style) -->
      <div class="text-center mb-16">
        <h2 class="text-5xl md:text-6xl font-bold mb-4 text-emerald-400">
          Projects
        </h2>
        <p class="text-gray-400 text-lg max-w-2xl mx-auto">
          A showcase of my most impactful and creative development projects
        </p>
      </div>

      <!-- Project Grid -->
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 md:gap-8">
        <!-- Project Card 1 -->
        <div
          class="bg-gray-800 rounded-xl overflow-hidden shadow-lg transition-all duration-300 hover:shadow-emerald-400/20 hover:scale-[1.02] flex flex-col"
        >
          <div
            class="h-40 sm:h-48 bg-gray-700 flex items-center justify-center"
          >
            <svg
              class="w-12 h-12 sm:w-16 sm:h-16 text-emerald-400"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="1.5"
                d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4"
              />
            </svg>
          </div>
          <div class="p-4 sm:p-6 flex-grow text-left">
            <h3 class="text-2xl font-semibold mb-2 text-white">
              Intelligent Task Manager
            </h3>
            <p class="text-gray-300 mb-4 text-base leading-relaxed">
              A machine learning-powered task management application that
              prioritizes tasks based on user behavior and deadline proximity.
            </p>
            <div class="flex flex-wrap gap-2 mb-4">
              <span class="px-2 py-0.5 bg-gray-700 rounded-md text-xs"
                >Python</span
              >
              <span class="px-2 py-0.5 bg-gray-700 rounded-md text-xs"
                >TensorFlow</span
              >
              <span class="px-2 py-0.5 bg-gray-700 rounded-md text-xs"
                >Flask</span
              >
              <span class="px-2 py-0.5 bg-gray-700 rounded-md text-xs"
                >React</span
              >
            </div>
            <div class="flex gap-4 mt-auto">
              <a
                href="#"
                class="text-emerald-400 hover:text-emerald-300 flex items-center gap-2 text-base"
              >
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path
                    d="M12 2a10 10 0 0 0-3.16 19.48c.5.09.68-.22.68-.48v-1.7c-2.78.61-3.37-1.17-3.37-1.17-.45-1.16-1.1-1.47-1.1-1.47-.9-.62.07-.61.07-.61 1 .07 1.52 1.03 1.52 1.03.9 1.52 2.37 1.08 2.95.83.09-.65.35-1.09.63-1.34-2.22-.25-4.55-1.11-4.55-4.95 0-1.09.39-1.98 1.03-2.68-.1-.25-.45-1.28.1-2.67 0 0 .84-.27 2.75 1.02a9.57 9.57 0 0 1 5 0C16 6.6 16.84 6.87 16.84 6.87c.55 1.39.2 2.42.1 2.67.64.7 1.03 1.59 1.03 2.68 0 3.85-2.34 4.7-4.57 4.95.36.31.68.92.68 1.86v2.76c0 .27.18.58.69.48A10 10 0 0 0 12 2Z"
                  />
                </svg>
                Code
              </a>
              <a
                href="#"
                class="text-emerald-400 hover:text-emerald-300 flex items-center gap-2 text-base"
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
                    d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
                  />
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"
                  />
                </svg>
                Demo
              </a>
            </div>
          </div>
        </div>

        <!-- Project Card 2 -->
        <div
          class="bg-gray-800 rounded-xl overflow-hidden shadow-lg transition-all duration-300 hover:shadow-emerald-400/20 hover:scale-[1.02] flex flex-col"
        >
          <div
            class="h-40 sm:h-48 bg-gray-700 flex items-center justify-center"
          >
            <svg
              class="w-12 h-12 sm:w-16 sm:h-16 text-emerald-400"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="1.5"
                d="M3 15a4 4 0 004 4h9a5 5 0 10-.1-9.999 5.002 5.002 0 10-9.78 2.096A4.001 4.001 0 003 15z"
              />
            </svg>
          </div>
          <div class="p-4 sm:p-6 flex-grow text-left">
            <h3 class="text-2xl font-semibold mb-2 text-white">
              Cloud-Based File System
            </h3>
            <p class="text-gray-300 mb-4 text-base leading-relaxed">
              A secure cloud storage solution with end-to-end encryption, file
              versioning, and collaborative editing features.
            </p>
            <div class="flex flex-wrap gap-2 mb-4">
              <span class="px-2 py-0.5 bg-gray-700 rounded-md text-xs"
                >Node.js</span
              >
              <span class="px-2 py-0.5 bg-gray-700 rounded-md text-xs"
                >Express</span
              >
              <span class="px-2 py-0.5 bg-gray-700 rounded-md text-xs"
                >AWS S3</span
              >
              <span class="px-2 py-0.5 bg-gray-700 rounded-md text-xs"
                >Vue.js</span
              >
            </div>
            <div class="flex gap-4 mt-auto">
              <a
                href="#"
                class="text-emerald-400 hover:text-emerald-300 flex items-center gap-2 text-base"
              >
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path
                    d="M12 2a10 10 0 0 0-3.16 19.48c.5.09.68-.22.68-.48v-1.7c-2.78.61-3.37-1.17-3.37-1.17-.45-1.16-1.1-1.47-1.1-1.47-.9-.62.07-.61.07-.61 1 .07 1.52 1.03 1.52 1.03.9 1.52 2.37 1.08 2.95.83.09-.65.35-1.09.63-1.34-2.22-.25-4.55-1.11-4.55-4.95 0-1.09.39-1.98 1.03-2.68-.1-.25-.45-1.28.1-2.67 0 0 .84-.27 2.75 1.02a9.57 9.57 0 0 1 5 0C16 6.6 16.84 6.87 16.84 6.87c.55 1.39.2 2.42.1 2.67.64.7 1.03 1.59 1.03 2.68 0 3.85-2.34 4.7-4.57 4.95.36.31.68.92.68 1.86v2.76c0 .27.18.58.69.48A10 10 0 0 0 12 2Z"
                  />
                </svg>
                Code
              </a>
              <a
                href="#"
                class="text-emerald-400 hover:text-emerald-300 flex items-center gap-2 text-base"
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
                    d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
                  />
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"
                  />
                </svg>
                Demo
              </a>
            </div>
          </div>
        </div>

        <!-- (Project 3 and 4 remain the same — copy from your original code) -->
      </div>

      <!-- View More Button -->
      <div class="mt-12 text-center">
        <a
          href="#"
          class="inline-flex items-center gap-2 px-6 py-3 bg-emerald-600 hover:bg-emerald-700 text-white font-medium rounded-md transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-emerald-500"
        >
          <span>View More Projects</span>
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
              d="M14 5l7 7m0 0l-7 7m7-7H3"
            />
          </svg>
        </a>
      </div>
    </div>
  </section>
</template>

<script setup>
import { onMounted, ref, onBeforeUnmount } from "vue";

const matchCardHeights = () => {
  if (window.innerWidth >= 640) {
    const rows = document.querySelectorAll(".grid");
    rows.forEach((row) => {
      const cards = row.querySelectorAll(".bg-gray-800");
      let maxHeight = 0;
      cards.forEach((card) => {
        card.style.height = "auto";
        const height = card.offsetHeight;
        maxHeight = Math.max(maxHeight, height);
      });
      cards.forEach((card) => {
        card.style.height = `${maxHeight}px`;
      });
    });
  }
};

onMounted(() => {
  matchCardHeights();
  window.addEventListener("resize", matchCardHeights);
});

onBeforeUnmount(() => {
  window.removeEventListener("resize", matchCardHeights);
});
</script>

<style scoped>
section {
  scroll-margin-top: 3rem;
  position: relative;
  overflow: hidden;
}

/* Animated emerald gradient background */
section::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(
    135deg,
    rgba(6, 95, 70, 0.1) 0%,
    rgba(16, 185, 129, 0.05) 25%,
    rgba(6, 78, 59, 0.1) 50%,
    rgba(16, 185, 129, 0.05) 75%,
    rgba(6, 95, 70, 0.1) 100%
  );
  z-index: -1;
  background-size: 400% 400%;
  animation: gradientFlow 15s ease infinite;
}

@keyframes gradientFlow {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

@media (max-width: 639px) {
  .bg-gray-800 {
    height: auto !important;
  }
  .grid {
    row-gap: 1.5rem;
  }
  h2 {
    margin-bottom: 1.25rem;
  }
}
</style>
