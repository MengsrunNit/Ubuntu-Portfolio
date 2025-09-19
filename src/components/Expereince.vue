<template>
  <section
    id="experience"
    class="py-16 px-4 md:px-8 bg-gray-800 flex justify-center"
  >
    <div class="max-w-5xl mx-auto w-full">
      <h2 class="text-3xl font-bold text-emerald-400 mb-8 text-center">
        Experience
      </h2>

      <div class="space-y-12 max-w-3xl mx-auto">
        <!-- Experience Item 1 -->
        <div class="relative pl-8 border-l-2 border-emerald-500">
          <div
            class="absolute w-4 h-4 bg-emerald-500 rounded-full -left-[9px] top-1"
          ></div>
          <div class="mb-1">
            <h3 class="text-xl font-semibold">Software Engineering Intern</h3>
            <p class="text-emerald-400">Tech Solutions Inc.</p>
          </div>
          <p class="text-sm text-gray-400 mb-4">May 2023 - August 2023</p>
          <ul class="list-disc list-inside text-gray-300 space-y-2">
            <li>
              Developed and maintained RESTful APIs using Node.js and Express,
              improving system response time by 30%
            </li>
            <li>
              Collaborated with senior developers to implement new features for
              the company's main web application
            </li>
            <li>
              Participated in code reviews and contributed to improving the
              development workflow
            </li>
            <li>
              Utilized Git for version control and collaborated with team
              members using GitHub
            </li>
          </ul>
        </div>

        <!-- Experience Item 2 -->
        <div class="relative pl-8 border-l-2 border-emerald-500">
          <div
            class="absolute w-4 h-4 bg-emerald-500 rounded-full -left-[9px] top-1"
          ></div>
          <div class="mb-1">
            <h3 class="text-xl font-semibold">
              Teaching Assistant - Data Structures
            </h3>
            <p class="text-emerald-400">
              Furman University, Computer Science Department
            </p>
          </div>
          <p class="text-sm text-gray-400 mb-4">September 2022 - Present</p>
          <ul class="list-disc list-inside text-gray-300 space-y-2">
            <li>
              Assist professor in conducting lab sessions for undergraduate data
              structures course
            </li>
            <li>
              Hold weekly office hours to provide one-on-one assistance to
              students
            </li>
            <li>
              Grade assignments and provide detailed feedback to help students
              improve
            </li>
            <li>
              Created supplementary learning materials to explain complex
              concepts
            </li>
          </ul>
        </div>

        <!-- Experience Item 3 -->
        <div class="relative pl-8 border-l-2 border-emerald-500">
          <div
            class="absolute w-4 h-4 bg-emerald-500 rounded-full -left-[9px] top-1"
          ></div>
          <div class="mb-1">
            <h3 class="text-xl font-semibold">Web Development Project Lead</h3>
            <p class="text-emerald-400">Student Technology Association</p>
          </div>
          <p class="text-sm text-gray-400 mb-4">January 2022 - May 2022</p>
          <ul class="list-disc list-inside text-gray-300 space-y-2">
            <li>
              Led a team of 4 students in developing the association's website
              using Vue.js
            </li>
            <li>
              Implemented responsive design principles ensuring optimal display
              across all devices
            </li>
            <li>
              Managed project timeline and task distribution using Agile
              methodologies
            </li>
            <li>Presented the completed project to faculty and student body</li>
          </ul>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
// Experience data could be moved to reactive data if needed
</script>

<style scoped>
section {
  scroll-margin-top: 3rem;
}

.border-l-2 {
  position: relative;
}

@media (max-width: 640px) {
  .border-l-2 {
    margin-left: 0.5rem;
  }
}
</style>
