<template>
  <section id="about" class="py-16 px-4 md:px-8 bg-gray-900">
    <div class="max-w-5xl mx-auto">
      <h2 class="text-3xl font-bold text-emerald-400 mb-8">About Me</h2>

      <div class="grid md:grid-cols-2 gap-10">
        <div>
          <h3 class="text-xl font-semibold mb-4">Who I Am</h3>
          <p class="text-gray-300 mb-4">
            I'm a Computer Science senior at Furman University with a passion
            for building innovative solutions and exploring new technologies. My
            academic journey has equipped me with a strong foundation in
            software development, algorithms, and problem-solving.
          </p>
          <p class="text-gray-300 mb-4">
            Beyond coding, I enjoy contributing to open-source projects and
            participating in hackathons, which help me stay at the cutting edge
            of technology while collaborating with diverse teams.
          </p>

          <h3 class="text-xl font-semibold mt-8 mb-4">Education</h3>
          <div class="mb-4">
            <p class="font-medium">Furman University</p>
            <p class="text-emerald-400">B.S. in Computer Science</p>
            <p class="text-sm text-gray-400">Expected Graduation: May 2024</p>
            <p class="text-sm text-gray-300 mt-1">GPA: 3.8/4.0</p>
          </div>
        </div>

        <div>
          <h3 class="text-xl font-semibold mb-4">Skills</h3>

          <div class="mb-6">
            <h4 class="font-medium text-emerald-400 mb-2">
              Programming Languages
            </h4>
            <div class="flex flex-wrap gap-2">
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >JavaScript</span
              >
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >Python</span
              >
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >Java</span
              >
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >C++</span
              >
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >SQL</span
              >
            </div>
          </div>

          <div class="mb-6">
            <h4 class="font-medium text-emerald-400 mb-2">Web Technologies</h4>
            <div class="flex flex-wrap gap-2">
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >Vue.js</span
              >
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >React</span
              >
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >Node.js</span
              >
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >HTML/CSS</span
              >
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >Tailwind CSS</span
              >
            </div>
          </div>

          <div class="mb-6">
            <h4 class="font-medium text-emerald-400 mb-2">
              Tools & Technologies
            </h4>
            <div class="flex flex-wrap gap-2">
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >Git</span
              >
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >Docker</span
              >
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >AWS</span
              >
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >MongoDB</span
              >
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >PostgreSQL</span
              >
            </div>
          </div>

          <div>
            <h4 class="font-medium text-emerald-400 mb-2">Soft Skills</h4>
            <div class="flex flex-wrap gap-2">
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >Problem Solving</span
              >
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >Team Collaboration</span
              >
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >Communication</span
              >
              <span class="px-3 py-1 bg-gray-800 rounded-full text-sm"
                >Time Management</span
              >
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
// Skills and information could be moved to reactive data if needed
</script>

<style scoped>
section {
  scroll-margin-top: 3rem;
}
</style>
