<template>
  <section id="home" class="relative min-h-screen overflow-hidden bg-gray-950">
    <!-- Background layers -->
    <div aria-hidden="true" class="absolute inset-0">
      <!-- soft gradient wash -->
      <div
        class="absolute inset-0 bg-gradient-to-br from-emerald-900/25 via-gray-900 to-gray-950"
      />

      <!-- subtle grid pattern using radial mask -->
      <div
        class="absolute inset-0 [background:radial-gradient(circle_at_center,theme(colors.emerald.500)/6_0,transparent_55%)] opacity-70"
      />

      <!-- glowing blobs -->
      <div
        class="absolute -top-10 -right-16 h-80 w-80 rounded-full bg-emerald-500/15 blur-3xl"
      />
      <div
        class="absolute -bottom-10 -left-16 h-96 w-96 rounded-full bg-emerald-600/10 blur-3xl"
      />
    </div>

    <div
      class="relative z-10 mx-auto grid max-w-6xl items-center justify-center gap-12 px-6 py-24 md:grid-cols-2 lg:gap-16"
    >
      <!-- Image/Name column (left, centered) -->
      <div
        class="order-1 relative flex flex-col items-center gap-6 md:order-1 md:items-center"
      >
        <!-- soft glow -->
        <div
          aria-hidden="true"
          class="absolute inset-0 animate-pulse rounded-full bg-emerald-500/15 blur-3xl"
        ></div>

        <!-- portrait -->
        <div
          class="relative z-10 rounded-3xl bg-gradient-to-br from-emerald-400/20 to-transparent p-2 shadow-2xl backdrop-blur-sm"
        >
          <img
            src="../assets/Mengsrunpf.jpeg"
            alt="Portrait of Mengsrun Nit"
            class="h-72 w-72 md:h-[28rem] md:w-[28rem] rounded-2xl border border-white/10 object-cover shadow-xl"
            style="object-position: 50% 20%"
            loading="lazy"
            decoding="async"
          />
          <!-- decorative ring -->
          <div
            class="pointer-events-none absolute inset-0 -z-10 rounded-[1.6rem] bg-gradient-to-tr from-emerald-500/30 to-transparent blur-xl"
          ></div>
        </div>

        <!-- name + role (centered below image) -->
        <div class="relative z-10 text-center">
          <h1
            class="text-4xl md:text-5xl font-extrabold leading-tight text-white"
          >
            <span
              class="bg-gradient-to-r from-emerald-300 via-teal-300 to-emerald-400 bg-clip-text text-transparent"
            >
              Mengsrun Nit
            </span>
          </h1>
          <div
            class="mt-2 inline-flex items-center gap-2 rounded-full border border-emerald-500/30 bg-emerald-500/10 px-3 py-1 text-emerald-300"
          >
            <span
              class="h-2 w-2 animate-pulse rounded-full bg-emerald-400"
            ></span>
            <span class="text-xs font-medium tracking-wide"
              >Backend-developer</span
            >
          </div>
        </div>
      </div>

      <!-- Text column (right) -->
      <!-- Text column (right of photo, no name) -->
      <div
        class="order-1 md:order-2 flex flex-col justify-center text-center md:text-left md:-mt-10"
      >
        <!-- Role -->
        <h2
          class="mt-0 text-4xl md:text-6xl font-extrabold tracking-tight bg-gradient-to-r from-emerald-300 via-teal-300 to-emerald-400 bg-clip-text text-transparent"
        >
          Software Engineer
        </h2>

        <!-- Bio -->
        <p
          class="mt-6 max-w-prose text-xl leading-relaxed text-gray-200 md:max-w-lg md:text-2xl"
        >
          I’m passionate about building
          <span class="text-emerald-400 font-semibold">backend systems</span>,
          <span class="text-emerald-400 font-semibold"
            >cloud infrastructure</span
          >, and
          <span class="text-emerald-400 font-semibold">AI-driven features</span>
          that make apps fast and reliable. Experienced with
          <span class="text-emerald-300 font-semibold"><b>FastAPI</b></span
          >, <span class="text-emerald-300 font-semibold"><b>Node.js</b></span
          >,
          <span class="text-emerald-300 font-semibold"
            ><b>cloud servers</b></span
          >, and
          <span class="text-emerald-300 font-semibold"><b>databases</b></span>
          and always eager to learn and build better systems.
        </p>

        <!-- Buttons -->
        <div class="mt-8 flex flex-wrap justify-center md:justify-start gap-4">
          <a
            href="#contact"
            class="rounded-md bg-emerald-600 px-6 py-3 font-medium text-white shadow-lg shadow-emerald-900/40 transition-all duration-200 hover:translate-y-[-1px] hover:bg-emerald-700 focus:outline-none focus:ring-2 focus:ring-emerald-500"
            aria-label="Contact Mengsrun"
          >
            Contact Me
          </a>
          <a
            href="#projects"
            class="rounded-md border border-emerald-500/60 px-6 py-3 font-medium text-emerald-300 transition-all duration-200 hover:translate-y-[-1px] hover:bg-emerald-950/40 focus:outline-none focus:ring-2 focus:ring-emerald-500"
            aria-label="View projects"
          >
            View My Work
          </a>
        </div>
      </div>
    </div>

    <!-- Decorative bottom wave -->
    <div
      aria-hidden="true"
      class="pointer-events-none absolute bottom-0 left-0 right-0 z-0"
    >
      <svg
        viewBox="0 0 1440 180"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        class="h-24 w-full opacity-30"
      >
        <path
          d="M0 100c120 40 240 60 360 60s240-20 360-60 240-60 360-60 240 20 360 60v80H0v-80z"
          fill="url(#g)"
        />
        <defs>
          <linearGradient id="g" x1="0" y1="0" x2="1" y2="0">
            <stop offset="0%" stop-color="#34d399" />
            <stop offset="100%" stop-color="#065f46" />
          </linearGradient>
        </defs>
      </svg>
    </div>

    <!-- Scroll indicator -->
    <div
      class="absolute bottom-8 inset-x-0 z-20 flex flex-col items-center"
      aria-hidden="true"
    >
      <div class="mb-2 text-center text-sm text-gray-400">Scroll Down</div>
      <div
        class="flex h-10 w-6 justify-center rounded-full border-2 border-gray-400"
      >
        <div class="mt-2 h-3 w-1.5 animate-bounce rounded-full bg-gray-400" />
      </div>
    </div>
  </section>
</template>
<script setup lang="ts"></script>

<style scoped>
section {
  scroll-margin-top: 3rem;
}

/* small fade-in on mount */
:slotted(*) {
  animation: fade-in 0.5s ease both;
}

@keyframes fade-in {
  from {
    opacity: 0;
    transform: translateY(4px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>
