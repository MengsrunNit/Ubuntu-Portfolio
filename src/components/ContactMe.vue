<template>
  <section id="contact" class="py-20 px-4 md:px-8 bg-gray-900">
    <div class="max-w-2xl mx-auto">
  <h2 class="section-title text-emerald-400 mb-3">Contact Me</h2>
      <p class="text-gray-300 mb-8">
        Have a project, collaboration, or question? Drop me a line—I'll reply as
        soon as I can.
      </p>

      <!-- Card: Only the form -->
      <div
        class="bg-gray-800/60 backdrop-blur p-6 md:p-8 rounded-2xl border border-gray-700"
      >
        <form @submit.prevent="handleSubmit" class="space-y-5" novalidate>
          <div class="grid md:grid-cols-2 gap-4">
            <div>
              <label
                for="name"
                class="block text-sm font-medium text-gray-300 mb-1"
                >Name</label
              >
              <input
                type="text"
                id="name"
                v-model.trim="form.name"
                :aria-invalid="!!errors.name"
                :aria-describedby="errors.name ? 'name-error' : undefined"
                required
                class="w-full px-4 py-2 bg-gray-900/60 border border-gray-700 rounded-md text-white focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:border-transparent"
              />
              <p
                v-if="errors.name"
                id="name-error"
                class="mt-1 text-sm text-red-400"
              >
                {{ errors.name }}
              </p>
            </div>

            <div>
              <label
                for="email"
                class="block text-sm font-medium text-gray-300 mb-1"
                >Email</label
              >
              <input
                type="email"
                id="email"
                v-model.trim="form.email"
                :aria-invalid="!!errors.email"
                :aria-describedby="errors.email ? 'email-error' : undefined"
                required
                class="w-full px-4 py-2 bg-gray-900/60 border border-gray-700 rounded-md text-white focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:border-transparent"
              />
              <p
                v-if="errors.email"
                id="email-error"
                class="mt-1 text-sm text-red-400"
              >
                {{ errors.email }}
              </p>
            </div>
          </div>

          <div>
            <label
              for="subject"
              class="block text-sm font-medium text-gray-300 mb-1"
              >Subject</label
            >
            <input
              type="text"
              id="subject"
              v-model.trim="form.subject"
              class="w-full px-4 py-2 bg-gray-900/60 border border-gray-700 rounded-md text-white focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:border-transparent"
              placeholder="What's this about?"
            />
          </div>

          <div>
            <div class="flex items-center justify-between mb-1">
              <label
                for="message"
                class="block text-sm font-medium text-gray-300"
                >Message</label
              >
              <span class="text-xs text-gray-400"
                >{{ form.message.length }} / {{ limits.message }}</span
              >
            </div>
            <textarea
              id="message"
              v-model.trim="form.message"
              :maxlength="limits.message"
              rows="6"
              :aria-invalid="!!errors.message"
              :aria-describedby="errors.message ? 'message-error' : undefined"
              required
              class="w-full px-4 py-3 bg-gray-900/60 border border-gray-700 rounded-md text-white focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:border-transparent"
              placeholder="Tell me a little about your goals, timeline, and any links."
            ></textarea>
            <p
              v-if="errors.message"
              id="message-error"
              class="mt-1 text-sm text-red-400"
            >
              {{ errors.message }}
            </p>
          </div>

          <!-- Honeypot (basic bot protection) -->
          <label class="hidden" for="company">Company</label>
          <input
            id="company"
            v-model="honeypot"
            type="text"
            class="hidden"
            tabindex="-1"
            autocomplete="off"
          />

          <button
            type="submit"
            :disabled="loading"
            class="w-full py-3 px-4 bg-emerald-600 hover:bg-emerald-700 disabled:opacity-60 disabled:cursor-not-allowed text-white font-medium rounded-md transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-emerald-500 flex items-center justify-center gap-2"
          >
            <svg
              v-if="loading"
              class="w-5 h-5 animate-spin"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
            >
              <circle
                cx="12"
                cy="12"
                r="10"
                stroke-width="4"
                class="opacity-20"
              />
              <path
                d="M4 12a8 8 0 0 1 8-8"
                stroke-width="4"
                stroke-linecap="round"
              />
            </svg>
            <span>{{ loading ? "Sending…" : "Send Message" }}</span>
          </button>
        </form>

        <p
          v-if="formStatus"
          :class="formStatus.success ? 'text-emerald-400' : 'text-red-400'"
          class="mt-4 text-center"
          role="status"
          aria-live="polite"
        >
          {{ formStatus.message }}
        </p>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref } from "vue";

// Set your recipient in Formspree to: nitmengsrun@gmail.com
// In Formspree dashboard, create a form and copy the endpoint below.
const FORMSPREE_ENDPOINT = "https://formspree.io/f/xpworgej"; // ← replace with your real ID

const limits = { message: 1000 };

const form = ref({
  name: "",
  email: "",
  subject: "",
  message: "",
});

const errors = ref({ name: "", email: "", message: "" });
const formStatus = ref(null);
const loading = ref(false);
const honeypot = ref(""); // Must remain empty; if filled, likely a bot

function validate() {
  errors.value = { name: "", email: "", message: "" };

  if (!form.value.name) {
    errors.value.name = "Please enter your name.";
  }

  if (!form.value.email) {
    errors.value.email = "Please enter your email.";
  } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(form.value.email)) {
    errors.value.email = "Please enter a valid email address.";
  }

  if (!form.value.message) {
    errors.value.message = "Please enter a message.";
  } else if (form.value.message.length < 10) {
    errors.value.message =
      "A little more detail would help (min 10 characters).";
  }

  return !errors.value.name && !errors.value.email && !errors.value.message;
}

async function handleSubmit() {
  if (honeypot.value) {
    // Bot detected
    formStatus.value = { success: false, message: "Submission blocked." };
    return;
  }

  if (!validate()) {
    formStatus.value = {
      success: false,
      message: "Please fix the errors above.",
    };
    return;
  }

  loading.value = true;
  formStatus.value = null;

  try {
    const payload = {
      name: form.value.name,
      email: form.value.email,
      subject: form.value.subject,
      message: form.value.message,
      _subject: form.value.subject || `New message from ${form.value.name}`,
      _gotcha: honeypot.value, // honeypot field
      _via: "portfolio-contact-form",
    };

    const response = await fetch(FORMSPREE_ENDPOINT, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify(payload),
    });

    if (!response.ok) throw new Error("Network response was not ok");

    formStatus.value = {
      success: true,
      message: "Thanks! Your message has been sent successfully.",
    };

    // Reset form
    form.value = { name: "", email: "", subject: "", message: "" };
  } catch (e) {
    formStatus.value = {
      success: false,
      message: "Something went wrong. Please try again.",
    };
  } finally {
    loading.value = false;
    // Clear status after 6 seconds
    setTimeout(() => (formStatus.value = null), 6000);
  }
}
</script>

<style scoped>
section {
  scroll-margin-top: 3rem;
}
</style>
