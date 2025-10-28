<template>
  <section id="contact" class="py-16 px-4 md:px-8 bg-gray-800">
    <div class="max-w-5xl mx-auto">
      <h2 class="text-3xl font-bold text-emerald-400 mb-8">Contact Me</h2>

      <div class="grid md:grid-cols-2 gap-12">
        <!-- Left: Contact Info -->
        <div>
          <p class="text-gray-300 mb-6">
            I'm currently looking for new opportunities to apply my skills and
            knowledge in a professional environment. Feel free to reach out if
            you're interested in working together or have any questions.
          </p>

          <div class="space-y-4 mt-8">
            <div class="flex items-center gap-4">
              <div
                class="w-10 h-10 rounded-full bg-emerald-500/20 flex items-center justify-center text-emerald-400"
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
                    d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"
                  />
                </svg>
              </div>
              <div>
                <p class="text-sm text-gray-400">Email</p>
                <a
                  href="mailto:mengsrun.nit@furman.edu"
                  class="text-emerald-400 hover:text-emerald-300"
                  >mengsrun.nit@furman.edu</a
                >
              </div>
            </div>

            <div class="flex items-center gap-4">
              <div
                class="w-10 h-10 rounded-full bg-emerald-500/20 flex items-center justify-center text-emerald-400"
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
                    d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
                  />
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"
                  />
                </svg>
              </div>
              <div>
                <p class="text-sm text-gray-400">Location</p>
                <p class="text-white">Greenville, South Carolina</p>
              </div>
            </div>

            <div class="flex items-center gap-4">
              <div
                class="w-10 h-10 rounded-full bg-emerald-500/20 flex items-center justify-center text-emerald-400"
              >
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path
                    d="M12 2a10 10 0 0 0-3.16 19.48c.5.09.68-.22.68-.48v-1.7c-2.78.61-3.37-1.17-3.37-1.17-.45-1.16-1.1-1.47-1.1-1.47-.9-.62.07-.61.07-.61 1 .07 1.52 1.03 1.52 1.03.9 1.52 2.37 1.08 2.95.83.09-.65.35-1.09.63-1.34-2.22-.25-4.55-1.11-4.55-4.95 0-1.09.39-1.98 1.03-2.68-.1-.25-.45-1.28.1-2.67 0 0 .84-.27 2.75 1.02a9.57 9.57 0 0 1 5 0C16 6.6 16.84 6.87 16.84 6.87c.55 1.39.2 2.42.1 2.67.64.7 1.03 1.59 1.03 2.68 0 3.85-2.34 4.7-4.57 4.95.36.31.68.92.68 1.86v2.76c0 .27.18.58.69.48A10 10 0 0 0 12 2Z"
                  />
                </svg>
              </div>
              <div>
                <p class="text-sm text-gray-400">GitHub</p>
                <a
                  href="https://github.com/mengsrunnit"
                  target="_blank"
                  rel="noopener noreferrer"
                  class="text-emerald-400 hover:text-emerald-300"
                  >github.com/mengsrunnit</a
                >
              </div>
            </div>

            <div class="flex items-center gap-4">
              <div
                class="w-10 h-10 rounded-full bg-emerald-500/20 flex items-center justify-center text-emerald-400"
              >
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path
                    d="M4.98 3.5a2.5 2.5 0 1 1 0 5 2.5 2.5 0 0 1 0-5ZM3 8.98h3.96V21H3V8.98Zm7.49 0H14.3v1.64h.05c.45-.86 1.55-1.77 3.2-1.77 3.43 0 4.06 2.25 4.06 5.18V21H17.6v-5.09c0-1.21-.02-2.77-1.69-2.77-1.69 0-1.95 1.32-1.95 2.68V21h-3.47V8.98Z"
                  />
                </svg>
              </div>
              <div>
                <p class="text-sm text-gray-400">LinkedIn</p>
                <a
                  href="https://www.linkedin.com/in/mengsrunnit"
                  target="_blank"
                  rel="noopener noreferrer"
                  class="text-emerald-400 hover:text-emerald-300"
                  >linkedin.com/in/mengsrunnit</a
                >
              </div>
            </div>
          </div>
        </div>

        <!-- Right: Contact Form -->
        <div class="bg-gray-900 p-6 rounded-xl">
          <h3 class="text-xl font-semibold mb-4">Send Me a Message</h3>

          <form @submit.prevent="handleSubmit" class="space-y-4">
            <div>
              <label
                for="name"
                class="block text-sm font-medium text-gray-400 mb-1"
                >Name</label
              >
              <input
                type="text"
                id="name"
                v-model="form.name"
                required
                class="w-full px-4 py-2 bg-gray-800 border border-gray-700 rounded-md text-white focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:border-transparent"
              />
            </div>

            <div>
              <label
                for="email"
                class="block text-sm font-medium text-gray-400 mb-1"
                >Email</label
              >
              <input
                type="email"
                id="email"
                v-model="form.email"
                required
                class="w-full px-4 py-2 bg-gray-800 border border-gray-700 rounded-md text-white focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:border-transparent"
              />
            </div>

            <div>
              <label
                for="subject"
                class="block text-sm font-medium text-gray-400 mb-1"
                >Subject</label
              >
              <input
                type="text"
                id="subject"
                v-model="form.subject"
                required
                class="w-full px-4 py-2 bg-gray-800 border border-gray-700 rounded-md text-white focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:border-transparent"
              />
            </div>

            <div>
              <label
                for="message"
                class="block text-sm font-medium text-gray-400 mb-1"
                >Message</label
              >
              <textarea
                id="message"
                v-model="form.message"
                rows="4"
                required
                class="w-full px-4 py-2 bg-gray-800 border border-gray-700 rounded-md text-white focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:border-transparent"
              ></textarea>
            </div>

            <button
              type="submit"
              class="w-full py-2 px-4 bg-emerald-600 hover:bg-emerald-700 text-white font-medium rounded-md transition-colors duration-200 transform focus:outline-none focus:ring-2 focus:ring-emerald-500"
            >
              Send Message
            </button>
          </form>

          <p
            v-if="formStatus"
            :class="formStatus.success ? 'text-emerald-400' : 'text-red-400'"
            class="mt-4 text-center"
          >
            {{ formStatus.message }}
          </p>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref } from "vue";

const form = ref({
  name: "",
  email: "",
  subject: "",
  message: "",
});

const formStatus = ref(null);

function handleSubmit() {
  // This would normally connect to a backend service
  // For now, we'll just simulate a successful submission

  // Simple validation
  if (!form.value.name || !form.value.email || !form.value.message) {
    formStatus.value = {
      success: false,
      message: "Please fill out all required fields",
    };
    return;
  }

  // Simulate API call
  setTimeout(() => {
    formStatus.value = {
      success: true,
      message: "Thank you for your message! I'll get back to you soon.",
    };

    // Reset form
    form.value = {
      name: "",
      email: "",
      subject: "",
      message: "",
    };

    // Clear status after 5 seconds
    setTimeout(() => {
      formStatus.value = null;
    }, 5000);
  }, 1000);
}
</script>

<style scoped>
section {
  scroll-margin-top: 3rem;
}
</style>
