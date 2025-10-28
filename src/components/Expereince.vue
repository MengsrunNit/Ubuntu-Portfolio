<template>
  <section id="experience" class="py-20 px-4 md:px-8 bg-gray-900 text-gray-100">
    <div class="max-w-6xl mx-auto">
      <!-- Section Header -->
      <div class="text-center mb-16">
        <h2 class="text-5xl md:text-6xl font-bold mb-4 text-emerald-400">
          Experience
        </h2>
        <p class="text-gray-400 text-lg max-w-2xl mx-auto">
          A journey through my professional and academic contributions
        </p>
      </div>

      <!-- Timeline -->
      <div class="relative">
        <div
          class="absolute left-0 md:left-8 top-0 bottom-0 w-0.5 bg-emerald-500/40"
        ></div>

        <div class="space-y-10">
          <div
            v-for="(exp, i) in experiences"
            :key="i"
            class="relative pl-0 md:pl-16 group"
          >
            <div class="absolute left-0 md:left-8 top-3">
              <div
                class="w-4 h-4 rounded-full bg-emerald-500 ring-4 ring-gray-900 group-hover:scale-110 transition-transform duration-200"
              ></div>
            </div>

            <article
              class="bg-gray-800/80 backdrop-blur rounded-2xl p-6 md:p-8 shadow-lg border border-gray-700/80 hover:border-emerald-500/40 hover:shadow-emerald-500/10 transition-all duration-300 text-left"
            >
              <header
                class="flex flex-col lg:flex-row lg:items-start lg:justify-between gap-6 text-left"
              >
                <div class="flex items-start gap-4 text-left">
                  <div
                    class="flex items-center justify-center w-16 h-16 rounded-xl p-2 border shadow-sm bg-gray-700/60 border-gray-600 overflow-hidden"
                  >
                    <img
                      :src="exp.logo"
                      :alt="exp.company + ' logo'"
                      class="w-full h-full object-contain"
                    />
                  </div>

                  <div class="min-w-0 text-left">
                    <h3 class="text-2xl font-semibold text-white leading-tight">
                      {{ exp.role }}
                    </h3>
                    <p
                      class="text-emerald-400 font-medium text-sm md:text-base mt-0.5"
                    >
                      {{ exp.company }}
                    </p>
                    <p
                      v-if="exp.location || exp.type"
                      class="text-gray-400 text-sm mt-1"
                    >
                      {{ exp.location }}
                      <span v-if="exp.location && exp.type">·</span>
                      {{ exp.type }}
                    </p>
                  </div>
                </div>

                <div class="lg:mt-1 shrink-0">
                  <span
                    class="inline-flex items-center px-3 py-1.5 rounded-full text-sm bg-emerald-500/10 text-emerald-400 border border-emerald-500/30"
                    aria-label="Period"
                  >
                    <svg
                      class="w-4 h-4 mr-1.5"
                      fill="none"
                      stroke="currentColor"
                      viewBox="0 0 24 24"
                      aria-hidden="true"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
                      />
                    </svg>
                    {{ exp.period }}
                  </span>
                </div>
              </header>

              <div class="w-full h-px bg-gray-700/80 my-5"></div>

              <p class="text-gray-300 leading-relaxed text-left">
                {{ exp.description }}
              </p>
            </article>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
const experiences = [
  {
    role: "Software Engineering Intern",
    company: "Investor Impact.",
    period: "August 2025 – Present",
    logo: "https://image.pitchbook.com/9ptmFJ7UNXwcTVePyuWjYmKnEt01670252267214_200x200",
    description:
      "Developed RESTful APIs using Node.js and Express while implementing new features for the main web application. Participated in code reviews and workflow improvements, utilizing Git and GitHub for version control and team collaboration.",
    type: "Internship",
    location: "Remote / Greenville, SC",
  },
  {
    role: "Freelance Web Developer",
    company: "Freelance Projects",
    period: "October 2025 – Present",
    logo: "https://cdn-icons-png.flaticon.com/512/5968/5968672.png",
    description:
      "Built responsive websites using Vue.js and TailwindCSS for local startups and personal brands. Optimized website performance and Lighthouse scores while integrating third-party APIs for e-commerce and analytics, delivering modern and scalable web solutions for clients.",
    type: "Freelance",
    location: "Remote",
  },
  {
    role: "Teaching Assistant",
    company: "Furman University, Computer Science Department",
    period: "September 2023 – May 2025",
    logo: "https://echodelta.co/wp-content/uploads/logo_furman-university@2x-1.png",
    description:
      "Assisted in lab sessions providing debugging support and held weekly office hours for student guidance. Graded assignments with detailed feedback and created supplementary learning materials to help students understand complex concepts.",
    type: "Academic",
    location: "Greenville, SC",
  },
  {
    role: "Backend Web Developer",
    company: "Institute of Technology of Cambodia",
    period: "Summer 2024 & Summer 2025",
    logo: "https://upload.wikimedia.org/wikipedia/en/f/f7/Institute_of_Technology_of_Cambodia_logo.png",
    description:
      "Led a 4-member team for website development, implementing responsive layouts for all devices. Managed projects with Agile methodologies and presented the completed website to stakeholders and faculty members.",
    type: "Contract",
    location: "Phnom Penh, Cambodia",
  },
  {
    role: "Summer Research",
    company: "Furman University",
    period: "May 2023 – August 2023",
    logo: "https://echodelta.co/wp-content/uploads/logo_furman-university@2x-1.png",
    description:
      "Researched machine learning model performance and explainability, building classification models with TensorFlow and scikit-learn. Analyzed large datasets and visualized insights using Pandas and Matplotlib, then co-authored a research report and presented findings to faculty.",
    type: "Research",
    location: "Greenville, SC",
  },
];
</script>

<style scoped>
section {
  scroll-margin-top: 4rem;
}
article:hover {
  transform: translateY(-2px);
  transition: 0.3s;
}
</style>
