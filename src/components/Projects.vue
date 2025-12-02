<template>
  <section id="projects" class="py-20 px-4 md:px-8 bg-gray-900 text-gray-100">
    <div class="max-w-6xl mx-auto">
      <div class="text-center mb-16">
        <h2 class="section-title text-emerald-400">
          Projects
        </h2>
        <p class="text-gray-400 text-lg max-w-2xl mx-auto">
          A showcase of my most impactful and creative development projects
        </p>
      </div>

      <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 md:gap-8">
        <div
          v-for="(project, index) in projects"
          :key="index"
          class="bg-gray-800 rounded-xl overflow-hidden shadow-lg transition-all duration-300 hover:shadow-emerald-400/20 hover:scale-[1.02] flex flex-col"
        >
          <!-- Placeholder Card Logic -->
          <template v-if="project.isPlaceholder">
            <div class="h-40 sm:h-48 bg-gray-700 flex items-center justify-center relative flex-1 min-h-[300px]">
              <span class="absolute top-3 left-3 inline-flex items-center gap-2 px-3 py-1 rounded-full bg-emerald-600/90 text-white text-xs font-medium shadow">
                <span class="relative flex h-2 w-2">
                  <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-white opacity-75"></span>
                  <span class="relative inline-flex rounded-full h-2 w-2 bg-white"></span>
                </span>
                Working on it
              </span>
              <svg class="w-12 h-12 sm:w-16 sm:h-16 text-emerald-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 15a4 4 0 004 4h9a5 5 0 10-.1-9.999 5.002 5.002 0 10-9.78 2.096A4.001 4.001 0 003 15z" />
              </svg>
            </div>
          </template>

          <!-- Real Project Card Logic -->
          <template v-else>
            <!-- Project Image / Header -->
            <div class="h-48 bg-gray-700 flex items-center justify-center relative overflow-hidden group">
              <img
                :src="project.image"
                :alt="project.title"
                class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110 group-hover:blur-[2px] opacity-90 group-hover:opacity-100"
              />

              <!-- Overlay with links -->
              <div class="absolute inset-0 bg-gray-900/60 backdrop-blur-sm opacity-0 group-hover:opacity-100 transition-all duration-300 flex items-center justify-center gap-4">
                <a
                  v-if="project.links.github"
                  :href="project.links.github"
                  target="_blank"
                  class="flex items-center gap-2 px-4 py-2 bg-gray-800 rounded-full hover:text-emerald-400 hover:bg-gray-700 transition-all duration-300 transform translate-y-4 group-hover:translate-y-0 hover:scale-105 shadow-lg border border-gray-700 font-medium text-sm"
                >
                  <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405 1.02 0 2.04.135 3 .405 2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.285 0 .315.225.69.825.57A12.02 12.02 0 0024 12c0-6.63-5.37-12-12-12z" />
                  </svg>
                  <span>Code</span>
                </a>
                <a
                  v-if="project.links.demo"
                  :href="project.links.demo"
                  target="_blank"
                  class="flex items-center gap-2 px-4 py-2 bg-gray-800 rounded-full hover:text-emerald-400 hover:bg-gray-700 transition-all duration-300 delay-75 transform translate-y-4 group-hover:translate-y-0 hover:scale-105 shadow-lg border border-gray-700 font-medium text-sm"
                >
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                  <span>Demo</span>
                </a>
              </div>
            </div>

            <!-- Content -->
            <div class="p-6 flex-1 flex flex-col">
              <h3 class="text-xl font-bold text-white mb-2">
                {{ project.title }}
              </h3>
              <p class="text-gray-400 text-sm mb-4 flex-1 leading-relaxed line-clamp-3">
                {{ project.shortDescription }}
              </p>

              <!-- Tech Stack -->
              <div class="flex flex-wrap gap-2 mb-6">
                <span
                  v-for="tech in project.techStack"
                  :key="tech"
                  class="px-2.5 py-1 bg-gray-700/50 border border-gray-600 text-emerald-400 text-xs rounded-md font-medium"
                >
                  {{ tech }}
                </span>
              </div>

              <!-- Actions -->
              <div class="flex items-center justify-between mt-auto pt-4 border-t border-gray-700/50">
                <button
                  @click="openModal(project)"
                  class="text-sm text-emerald-400 hover:text-emerald-300 font-medium flex items-center gap-1 transition-colors"
                >
                  Read More
                  <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                  </svg>
                </button>
                
                <div class="flex gap-3">
                  <a
                    v-if="project.links.github"
                    :href="project.links.github"
                    target="_blank"
                    class="text-gray-400 hover:text-white transition-colors"
                    title="View Code"
                  >
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                      <path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405 1.02 0 2.04.135 3 .405 2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.285 0 .315.225.69.825.57A12.02 12.02 0 0024 12c0-6.63-5.37-12-12-12z" />
                    </svg>
                  </a>
                  <a
                    v-if="project.links.demo"
                    :href="project.links.demo"
                    target="_blank"
                    class="text-gray-400 hover:text-white transition-colors"
                    title="Live Demo"
                  >
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                    </svg>
                  </a>
                </div>
              </div>
            </div>
          </template>
        </div>
      </div>
    </div>

    <!-- Project Details Modal -->
    <div
      v-if="showModal"
      class="fixed inset-0 z-50 flex items-center justify-center p-4 sm:p-6"
    >
      <div class="absolute inset-0 bg-black/80 backdrop-blur-sm" @click="closeModal"></div>
      <div class="relative bg-gray-800 rounded-2xl shadow-2xl w-full max-w-3xl max-h-[90vh] overflow-y-auto flex flex-col border border-gray-700">
        
        <!-- Modal Header -->
        <div class="relative h-48 sm:h-64 bg-gray-700 shrink-0">
          <img
            :src="selectedProject.image"
            :alt="selectedProject.title"
            class="w-full h-full object-cover opacity-90"
          />
          <div class="absolute inset-0 bg-gradient-to-t from-gray-900 to-transparent"></div>
          <button
            @click="closeModal"
            class="absolute top-4 right-4 p-2 bg-black/50 hover:bg-black/70 text-white rounded-full transition-colors backdrop-blur-md"
          >
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
          <div class="absolute bottom-4 left-6 right-6">
            <h3 class="text-2xl sm:text-3xl font-bold text-white mb-2">{{ selectedProject.title }}</h3>
            <div class="flex flex-wrap gap-2">
              <span
                v-for="tech in selectedProject.techStack"
                :key="tech"
                class="px-2.5 py-1 bg-emerald-500/20 border border-emerald-500/30 text-emerald-300 text-xs rounded-md font-medium"
              >
                {{ tech }}
              </span>
            </div>
          </div>
        </div>

        <!-- Modal Body -->
        <div class="p-6 sm:p-8 space-y-6">
          <div class="prose prose-invert max-w-none">
            <h4 class="text-lg font-semibold text-emerald-400 mb-2">Overview</h4>
            <div class="text-gray-300 leading-relaxed" v-html="selectedProject.longDescription"></div>
          </div>

          <div class="flex flex-wrap gap-4 pt-6 border-t border-gray-700">
            <a
              v-if="selectedProject.links.github"
              :href="selectedProject.links.github"
              target="_blank"
              class="flex items-center gap-2 px-6 py-2.5 bg-gray-700 hover:bg-gray-600 text-white rounded-lg transition-colors font-medium"
            >
              <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405 1.02 0 2.04.135 3 .405 2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.285 0 .315.225.69.825.57A12.02 12.02 0 0024 12c0-6.63-5.37-12-12-12z" />
              </svg>
              View Source Code
            </a>
            <a
              v-if="selectedProject.links.demo"
              :href="selectedProject.links.demo"
              target="_blank"
              class="flex items-center gap-2 px-6 py-2.5 bg-emerald-600 hover:bg-emerald-500 text-white rounded-lg transition-colors font-medium shadow-lg shadow-emerald-900/20"
            >
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
              </svg>
              Live Demo
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount } from "vue";

const showModal = ref(false);
const selectedProject = ref({});

const projects = [
  {
    title: "Book-Store Application",
    shortDescription: "A full-stack Node.js web application for managing online book inventory. Features a classic MVC architecture with Express.js and MongoDB.",
    longDescription: `
      <p class="mb-4">This Book-Store Application is a comprehensive full-stack solution designed to simulate a real-world e-commerce platform for books. Built using the robust Node.js runtime and Express.js framework, it follows the Model-View-Controller (MVC) architectural pattern to ensure code maintainability and separation of concerns.</p>

      <h5 class="text-lg font-semibold text-white mt-6 mb-2">Key Features</h5>
      <ul class="list-disc list-inside space-y-2 text-gray-300">
        <li><strong class="text-emerald-400">User Authentication & Authorization:</strong> Secure signup and login functionality using Passport.js.</li>
        <li><strong class="text-emerald-400">Product Management:</strong> CRUD operations for managing book inventory (Admin role).</li>
        <li><strong class="text-emerald-400">Shopping Cart:</strong> Dynamic cart functionality allowing users to add, remove, and update items.</li>
        <li><strong class="text-emerald-400">Order Processing:</strong> Simulated checkout process.</li>
        <li><strong class="text-emerald-400">Responsive UI:</strong> Crafted with EJS templating and custom CSS to ensure a seamless experience across devices.</li>
        <li><strong class="text-emerald-400">Containerization:</strong> Fully Dockerized for consistent development and deployment environments.</li>
      </ul>

      <p class="mt-4">The application leverages MongoDB for flexible data storage, handling complex relationships between users, products, and orders efficiently.</p>
    `,
    techStack: ["Node.js", "Express.js", "MongoDB", "Docker", "EJS"],
    image: "https://placehold.co/600x400/1f2937/34d399?text=Book+Store+App",
    links: {
      github: "https://github.com/MengsrunNit/Book-Store",
      demo: "https://book-store.mengsrun-nit.com"
    },
    isPlaceholder: false
  },
  {
    title: "RefurbTech Recommendations",
    shortDescription: "An intelligent, AI-powered platform designed to help users navigate the refurbished smartphone market. It combines a sophisticated recommendation engine, real-time price tracking models, and an interactive AI chatbot.",
    longDescription: `
      <p class="mb-4">RefurbTech Recommendations is an intelligent, AI-powered platform designed to help users navigate the refurbished smartphone market. It combines a sophisticated recommendation engine, real-time price tracking models, and an interactive AI chatbot to provide accurate, data-driven buying advice.</p>

      <h5 class="text-lg font-semibold text-white mt-6 mb-2">🎯 Purpose</h5>
      <ul class="list-disc list-inside space-y-2 text-gray-300">
        <li><strong class="text-emerald-400">Demystify Value:</strong> Accurately estimate the current market value of used phones using depreciation models.</li>
        <li><strong class="text-emerald-400">Personalize Search:</strong> Match users with the perfect device based on their specific needs (budget, ecosystem, usage) rather than just specs.</li>
        <li><strong class="text-emerald-400">Visualize Trends:</strong> Show how phone prices drop over time to help users decide when to buy.</li>
      </ul>

      <h5 class="text-lg font-semibold text-white mt-6 mb-2">🏗️ Infrastructure & Architecture</h5>
      <p class="mb-2">The project is built as a modern full-stack application with a decoupled frontend and backend, supported by a data ingestion pipeline.</p>
      <ul class="list-none space-y-2 text-gray-300">
        <li><strong class="text-emerald-400">1. Frontend (/web):</strong> A responsive, single-page application (SPA) featuring a modern "Glassmorphism" UI.</li>
        <li><strong class="text-emerald-400">2. Backend (/server):</strong> A RESTful API that handles business logic, AI processing, and pricing calculations.</li>
        <li><strong class="text-emerald-400">3. Data Pipeline (/data):</strong> Python scripts responsible for gathering and cleaning market data.</li>
      </ul>

      <h5 class="text-lg font-semibold text-white mt-6 mb-2">🚀 Key Features</h5>
      <ul class="list-disc list-inside space-y-2 text-gray-300">
        <li><strong class="text-emerald-400">AI Chatbot:</strong> Context-Aware RAG Integration fetches real-time phone specs to answer questions.</li>
        <li><strong class="text-emerald-400">Price Tracker:</strong> Visualizes the estimated value of phones over time with forecasting.</li>
        <li><strong class="text-emerald-400">Recommendation Engine:</strong> Scores phones based on user inputs (Longevity, Ecosystem, Usage, Budget).</li>
      </ul>
    `,
    techStack: ["Vue.js 3", "Node.js", "Express.js", "MongoDB", "OpenAI API", "Python", "Chart.js"],
    image: "https://placehold.co/600x400/1f2937/3b82f6?text=RefurbTech+AI",
    links: {
      github: "https://github.com/MengsrunNit/RefurbTech-Recommendations",
      demo: "https://refurbtech.mengsrun-nit.com/"
    },
    isPlaceholder: false
  },
  {
    isPlaceholder: true
  }
];

const openModal = (project) => {
  selectedProject.value = project;
  showModal.value = true;
  document.body.style.overflow = 'hidden'; // Prevent background scrolling
};

const closeModal = () => {
  showModal.value = false;
  document.body.style.overflow = ''; // Restore scrolling
};

const matchCardHeights = () => {
  if (window.innerWidth >= 640) {
    const rows = document.querySelectorAll(".grid");
    rows.forEach((row) => {
      const cards = row.querySelectorAll(".bg-gray-800");
      let maxHeight = 0;
      // Reset height to auto to get natural height
      cards.forEach((card) => {
        card.style.height = "auto";
      });
      // Measure
      cards.forEach((card) => {
        const height = card.offsetHeight;
        maxHeight = Math.max(maxHeight, height);
      });
      // Apply
      cards.forEach((card) => {
        card.style.height = `${maxHeight}px`;
      });
    });
  } else {
    // Reset on mobile
    const cards = document.querySelectorAll(".bg-gray-800");
    cards.forEach((card) => {
      card.style.height = "auto";
    });
  }
};

onMounted(() => {
  // Small delay to ensure DOM is rendered
  setTimeout(matchCardHeights, 100);
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

/* Custom Scrollbar for Modal */
.overflow-y-auto::-webkit-scrollbar {
  width: 8px;
}
.overflow-y-auto::-webkit-scrollbar-track {
  background: #1f2937;
}
.overflow-y-auto::-webkit-scrollbar-thumb {
  background: #4b5563;
  border-radius: 4px;
}
.overflow-y-auto::-webkit-scrollbar-thumb:hover {
  background: #6b7280;
}
</style>
