<template>
  <footer class="bg-gray-900 border-t border-gray-800 text-gray-400">
    <div
      class="max-w-6xl mx-auto px-4 md:px-8 py-6 flex flex-col md:flex-row items-center justify-between gap-3"
    >
      <!-- Brand / Copyright -->
      <p class="text-sm">© {{ new Date().getFullYear() }} Mengsrun Nit</p>

      <!-- Simple nav links -->
      <nav class="flex items-center gap-5">
        <a
          href="nitmengsrun@gmail.com"
          class="hover:text-emerald-400 hover:underline underline-offset-4 focus:outline-none focus-visible:ring-2 focus-visible:ring-emerald-500 rounded px-1"
        >
          Email
        </a>
        <a
          href="https://github.com/mengsrunnit"
          target="_blank"
          rel="noopener noreferrer"
          class="hover:text-emerald-400 hover:underline underline-offset-4 focus:outline-none focus-visible:ring-2 focus-visible:ring-emerald-500 rounded px-1"
        >
          GitHub
        </a>
        <a
          href="https://www.linkedin.com/in/mengsrunnit"
          target="_blank"
          rel="noopener noreferrer"
          class="hover:text-emerald-400 hover:underline underline-offset-4 focus:outline-none focus-visible:ring-2 focus-visible:ring-emerald-500 rounded px-1"
        >
          LinkedIn
        </a>
      </nav>
    </div>
  </footer>
</template>

<script setup>
// Minimal footer – no script logic needed
</script>
