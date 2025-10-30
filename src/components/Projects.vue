<template>
  <section id="projects" class="py-20 px-4 md:px-8 bg-gray-900 text-gray-100">
    <div class="max-w-6xl mx-auto">
      <div class="text-center mb-16">
        <h2 class="text-5xl md:text-6xl font-bold mb-4 text-emerald-400">
          Projects
        </h2>
        <p class="text-gray-400 text-lg max-w-2xl mx-auto">
          A showcase of my most impactful and creative development projects
        </p>
      </div>

      <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 md:gap-8">
        <!-- Working on it Card 1 -->
        <div
          class="bg-gray-800 rounded-xl overflow-hidden shadow-lg transition-all duration-300 hover:shadow-emerald-400/20 hover:scale-[1.02] flex flex-col"
        >
          <div
            class="h-40 sm:h-48 bg-gray-700 flex items-center justify-center relative"
          >
            <span
              class="absolute top-3 left-3 inline-flex items-center gap-2 px-3 py-1 rounded-full bg-emerald-600/90 text-white text-xs font-medium shadow"
            >
              <span class="relative flex h-2 w-2">
                <span
                  class="animate-ping absolute inline-flex h-full w-full rounded-full bg-white opacity-75"
                ></span>
                <span
                  class="relative inline-flex rounded-full h-2 w-2 bg-white"
                ></span>
              </span>
              Working on it
            </span>
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
        </div>

        <!-- Working on it Card 2 -->
        <div
          class="bg-gray-800 rounded-xl overflow-hidden shadow-lg transition-all duration-300 hover:shadow-emerald-400/20 hover:scale-[1.02] flex flex-col"
        >
          <div
            class="h-40 sm:h-48 bg-gray-700 flex items-center justify-center relative"
          >
            <span
              class="absolute top-3 left-3 inline-flex items-center gap-2 px-3 py-1 rounded-full bg-emerald-600/90 text-white text-xs font-medium shadow"
            >
              <span class="relative flex h-2 w-2">
                <span
                  class="animate-ping absolute inline-flex h-full w-full rounded-full bg-white opacity-75"
                ></span>
                <span
                  class="relative inline-flex rounded-full h-2 w-2 bg-white"
                ></span>
              </span>
              Working on it
            </span>
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
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { onMounted, onBeforeUnmount } from "vue";

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
