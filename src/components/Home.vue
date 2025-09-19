<template>
  <section
    id="hero"
    class="min-h-screen flex items-center justify-center px-6 py-20 bg-gray-900 relative overflow-hidden"
  >
    <!-- Background gradient effect -->
    <div
      class="absolute inset-0 bg-gradient-to-br from-emerald-900/20 to-gray-900 z-0"
    ></div>
    <div
      class="absolute top-20 right-10 w-72 h-72 bg-emerald-500/10 rounded-full blur-3xl"
    ></div>
    <div
      class="absolute bottom-20 left-10 w-80 h-80 bg-emerald-600/10 rounded-full blur-3xl"
    ></div>

    <div
      class="max-w-5xl mx-auto grid md:grid-cols-2 gap-12 items-center relative z-10"
    >
      <!-- Left: Text -->
      <div>
        <span class="text-emerald-400 font-medium">Hello, I'm</span>
        <h1 class="text-5xl font-bold mt-2 mb-4 text-white">Mengsrun Nit</h1>
        <h2 class="text-2xl text-gray-300 mb-6">Computer Science Student</h2>

        <p class="text-lg leading-relaxed text-gray-300 mb-8">
          A passionate programmer and problem-solver with a focus on web
          development and machine learning. Currently seeking software
          engineering opportunities.
        </p>

        <div class="flex flex-wrap gap-4 justify-center">
          <a
            href="#contact"
            class="px-6 py-3 bg-emerald-600 hover:bg-emerald-700 text-white font-medium rounded-md transition-all duration-200 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-emerald-500"
          >
            Contact Me
          </a>
          <a
            href="#projects"
            class="px-6 py-3 bg-transparent border border-emerald-500 text-emerald-400 hover:bg-emerald-900/30 font-medium rounded-md transition-all duration-200 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-emerald-500"
          >
            View My Work
          </a>
        </div>

        <!-- Tech stack icons -->
        <div class="mt-12 text-center">
          <p class="text-sm text-gray-400 mb-3">Tech Stack</p>
          <div class="flex flex-wrap gap-4 justify-center">
            <!-- Use real tech icons if available -->
            <div
              class="w-10 h-10 bg-white/10 rounded-full p-2 flex items-center justify-center"
            >
              <span class="text-lg">🌐</span>
              <!-- HTML -->
            </div>
            <div
              class="w-10 h-10 bg-white/10 rounded-full p-2 flex items-center justify-center"
            >
              <span class="text-lg">🎨</span>
              <!-- CSS -->
            </div>
            <div
              class="w-10 h-10 bg-white/10 rounded-full p-2 flex items-center justify-center"
            >
              <span class="text-lg">⚡</span>
              <!-- JS -->
            </div>
            <div
              class="w-10 h-10 bg-white/10 rounded-full p-2 flex items-center justify-center"
            >
              <span class="text-lg">🐍</span>
              <!-- Python -->
            </div>
            <div
              class="w-10 h-10 bg-white/10 rounded-full p-2 flex items-center justify-center"
            >
              <span class="text-lg">🟢</span>
              <!-- Vue -->
            </div>
            <div
              class="w-10 h-10 bg-white/10 rounded-full p-2 flex items-center justify-center"
            >
              <span class="text-lg">☕</span>
              <!-- Java -->
            </div>
          </div>
        </div>
      </div>

      <!-- Right: Image with animated glow effect -->
      <div class="flex justify-center relative">
        <div
          class="absolute inset-0 bg-emerald-500/20 rounded-full blur-3xl animate-pulse"
        ></div>
        <div
          class="relative z-10 p-2 bg-gradient-to-br from-emerald-500/30 to-transparent rounded-2xl backdrop-blur-sm"
        >
          <img
            src="../assets/Mengsrunpf.jpg"
            alt="Mengsrun's profile photo"
            class="w-72 h-72 object-cover rounded-2xl shadow-lg border border-white/10"
          />
        </div>
      </div>
    </div>

    <!-- Scroll indicator -->
    <div
      class="absolute bottom-8 left-1/2 transform -translate-x-1/2 flex flex-col items-center"
    >
      <span class="text-sm text-gray-400 mb-2">Scroll Down</span>
      <div
        class="w-6 h-10 border-2 border-gray-400 rounded-full flex justify-center"
      >
        <div
          class="w-1.5 h-3 bg-gray-400 rounded-full mt-2 animate-bounce"
        ></div>
      </div>
    </div>
  </section>
</template>

<script setup>
// No additional script needed
</script>

<style scoped>
section {
  scroll-margin-top: 3rem;
}
</style>
