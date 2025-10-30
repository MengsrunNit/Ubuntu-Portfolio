<!-- Update the Light/Dark Theme Background in App.vue -->
<!-- Keep trees in both themes, but switch sun/moon and add stars in dark mode -->
<template>
  <div
    class="min-h-screen bg-gray-900 text-white font-sans"
    :class="{ 'light-mode': !isDarkTheme }"
  >
    <!-- Enhanced Background Stars/Particles with movement - Dark Theme -->
    <div class="starry-background" v-if="isDarkTheme">
      <div
        v-for="n in 150"
        :key="n"
        class="star"
        :style="{
          left: `${Math.random() * 100}%`,
          top: `${Math.random() * 100}%`,
          opacity: Math.random() * 0.7 + 0.2,
          animationDelay: `${Math.random() * 30}s`,
          animationDuration: `${Math.random() * 40 + 20}s`,
          width: `${Math.random() * 2 + 1}px`,
          height: `${Math.random() * 2 + 1}px`,
          boxShadow: `0 0 ${Math.random() * 6 + 1}px rgba(255, 255, 255, ${
            Math.random() * 0.5 + 0.1
          })`,
        }"
      ></div>

      <!-- Add occasional shooting stars -->
      <div
        v-for="n in 5"
        :key="`shooting-${n}`"
        class="shooting-star"
        :style="{
          left: `${Math.random() * 100}%`,
          top: `${Math.random() * 50}%`,
          animationDelay: `${Math.random() * 30}s`,
          animationDuration: `${Math.random() * 5 + 5}s`,
        }"
      ></div>

      <!-- Moon in dark mode -->
      <div class="moon"></div>
    </div>

    <!-- Light Theme with Sun -->
    <div class="sunny-background" v-if="!isDarkTheme">
      <!-- Sun -->
      <div class="sun"></div>
    </div>

    <!-- Trees on the horizon - Present in both themes -->
    <div class="tree-line" :class="{ 'dark-trees': isDarkTheme }">
      <div
        class="tree"
        v-for="n in 7"
        :key="`tree-${n}`"
        :style="{
          left: `${(n - 1) * 15 + Math.random() * 5}%`,
          height: `${Math.random() * 30 + 70}px`,
          width: `${Math.random() * 15 + 40}px`,
        }"
      ></div>
    </div>

    <!-- Clouds - Only in light mode -->
    <div class="clouds" v-if="!isDarkTheme">
      <div
        class="cloud"
        v-for="n in 5"
        :key="`cloud-${n}`"
        :style="{
          left: `${Math.random() * 100}%`,
          top: `${Math.random() * 30 + 5}%`,
          opacity: Math.random() * 0.5 + 0.5,
          animationDelay: `${Math.random() * 60}s`,
          animationDuration: `${Math.random() * 120 + 60}s`,
          transform: `scale(${Math.random() * 0.5 + 0.7})`,
        }"
      ></div>
    </div>

    <!-- Birds - Only in light mode -->
    <div class="birds" v-if="!isDarkTheme">
      <div
        class="bird"
        v-for="n in 8"
        :key="`bird-${n}`"
        :style="{
          left: `${Math.random() * 100}%`,
          top: `${Math.random() * 40 + 10}%`,
          animationDelay: `${Math.random() * 10}s`,
          animationDuration: `${Math.random() * 20 + 15}s`,
        }"
      ></div>
    </div>

    <TopBar />
    <NavBar @theme-toggle="toggleTheme" :isDarkTheme="isDarkTheme" />
    <div class="pt-16">
      <!-- Add padding to account for fixed navbar -->
      <main>
        <Home id="home" />
        <AboutMe id="about" />
        <Experience id="experience" />
        <Projects id="projects" />
        <ContactMe id="contact" />
        <FooterSection />
      </main>
    </div>
  </div>
</template>

<script>
import AboutMe from "./components/AboutMe.vue";
import ContactMe from "./components/ContactMe.vue";
import Home from "./components/Home.vue";
import Projects from "./components/Projects.vue";
import NavBar from "./components/Navbar.vue";
import TopBar from "./components/TopBar.vue";
import Experience from "./components/Expereince.vue";
import FooterSection from "./components/FooterSection.vue";
import { ref, onMounted, onBeforeUnmount } from "vue";

export default {
  name: "App",
  components: {
    AboutMe,
    ContactMe,
    Home,
    Projects,
    NavBar,
    TopBar,
    Experience,
    FooterSection,
  },
  setup() {
    const isDarkTheme = ref(true); // Default to dark theme

    // Listen for theme changes from Navbar
    const handleThemeChange = (event) => {
      isDarkTheme.value = event.detail.isDark;
    };

    // Toggle theme (can be called from other components via emit)
    const toggleTheme = (isDark) => {
      isDarkTheme.value = isDark;
    };

    onMounted(() => {
      // Listen for theme change events
      window.addEventListener("theme-changed", handleThemeChange);

      // Check if theme is saved in localStorage
      const savedTheme = localStorage.getItem("portfolio-theme");
      if (savedTheme !== null) {
        isDarkTheme.value = savedTheme === "dark";
      }
    });

    onBeforeUnmount(() => {
      window.removeEventListener("theme-changed", handleThemeChange);
    });

    return {
      isDarkTheme,
      toggleTheme,
    };
  },
};
</script>

<style>
/* Global styles */
html {
  scroll-behavior: smooth;
  scroll-padding-top: 70px; /* Ensures anchor links account for fixed navbar */
}

body {
  background-color: #0f172a; /* Tailwind's dark blue background */
  color: #f3f4f6; /* Tailwind's text-gray-100 */
  font-family: "Inter", "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  margin: 0;
  padding: 0;
  overflow-x: hidden;
}

/* Light mode styles */
.light-mode {
  color: #1e293b; /* Darker text for light mode */
}

/* Add these styles to the <style> section of App.vue */

/* Moon styles for dark mode */
.moon {
  position: absolute;
  top: 10%;
  right: 10%;
  width: 70px;
  height: 70px;
  background: radial-gradient(circle, #f5f5f5 30%, #d9d9d9 70%);
  border-radius: 50%;
  box-shadow: 0 0 20px 10px rgba(240, 240, 240, 0.4);
  z-index: 1;
}

/* Moon craters */
.moon::before,
.moon::after {
  content: "";
  position: absolute;
  background-color: rgba(200, 200, 200, 0.4);
  border-radius: 50%;
}

.moon::before {
  width: 20px;
  height: 20px;
  top: 15px;
  left: 15px;
}

.moon::after {
  width: 15px;
  height: 15px;
  bottom: 20px;
  right: 20px;
}

/* Dark mode trees - more silhouette like */
.dark-trees .tree::after {
  background-color: #1f3024; /* Darker tree foliage */
}

.dark-trees .tree::before {
  background-color: #3d2c20; /* Darker tree trunk */
}

/* Keep the tree styles, but moved them to be shared between both themes */
.tree-line {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 15%;
  z-index: 1;
}

.tree-line.dark-trees {
  background-color: #1a3a1a; /* Darker green ground for dark mode */
}

.tree-line:not(.dark-trees) {
  background-color: #2e7d32; /* Keep original green for light mode */
}

/* Improve shooting star effect */
.shooting-star {
  position: absolute;
  width: 2px;
  height: 2px;
  background-color: white;
  z-index: 2;
  opacity: 0;
  transform: rotate(45deg);
  animation: shootingStar 8s linear infinite;
}

.shooting-star::before {
  content: "";
  position: absolute;
  width: 80px;
  height: 1px;
  background: linear-gradient(90deg, rgba(255, 255, 255, 0.8), transparent);
  transform: translateX(-100%);
}

@keyframes shootingStar {
  0% {
    opacity: 0;
    transform: translateX(0) translateY(0) rotate(315deg) scale(0);
  }
  1% {
    opacity: 1;
    transform: translateX(20px) translateY(20px) rotate(315deg) scale(1);
  }
  10% {
    opacity: 1;
    transform: translateX(200px) translateY(200px) rotate(315deg) scale(1);
  }
  12% {
    opacity: 0;
    transform: translateX(220px) translateY(220px) rotate(315deg) scale(0);
  }
  100% {
    opacity: 0;
    transform: translateX(220px) translateY(220px) rotate(315deg) scale(0);
  }
}

/* Sunny background for light mode */
.sunny-background {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 0;
  background: linear-gradient(to bottom, #87ceeb, #e0f7fa);
  overflow: hidden;
}

/* Sun */
.sun {
  position: absolute;
  top: 10%;
  right: 10%;
  width: 80px;
  height: 80px;
  background: radial-gradient(circle, #ffd700 30%, #ffa500 70%);
  border-radius: 50%;
  box-shadow: 0 0 40px 20px rgba(255, 215, 0, 0.6);
  animation: pulse 5s infinite alternate;
  z-index: 1;
}

@keyframes pulse {
  0% {
    box-shadow: 0 0 40px 20px rgba(255, 215, 0, 0.6);
  }
  100% {
    box-shadow: 0 0 60px 30px rgba(255, 215, 0, 0.8);
  }
}

/* Clouds */
.cloud {
  position: absolute;
  width: 150px;
  height: 50px;
  background-color: rgba(255, 255, 255, 0.9);
  border-radius: 50px;
  animation: cloudFloat linear infinite;
}

.cloud:before,
.cloud:after {
  content: "";
  position: absolute;
  background-color: rgba(255, 255, 255, 0.9);
  border-radius: 50%;
}

.cloud:before {
  width: 70px;
  height: 70px;
  top: -30px;
  left: 20px;
}

.cloud:after {
  width: 60px;
  height: 60px;
  top: -20px;
  right: 20px;
}

@keyframes cloudFloat {
  from {
    transform: translateX(-200px);
  }
  to {
    transform: translateX(calc(100vw + 200px));
  }
}

/* Trees */
.tree-line {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 15%;
  background-color: #2e7d32; /* Green ground */
  z-index: 1;
}

.tree {
  position: absolute;
  bottom: 100%;
  transform: translateX(-50%);
  width: 50px;
  height: 100px;
}

.tree:before {
  content: "";
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 15px;
  height: 20%;
  background-color: #795548; /* Tree trunk */
}

.tree:after {
  content: "";
  position: absolute;
  bottom: 15%;
  left: 0;
  width: 100%;
  height: 85%;
  background-color: #2e7d32; /* Tree foliage */
  border-radius: 50% 50% 25% 25%;
}

/* Birds */
.bird {
  position: absolute;
  width: 12px;
  height: 6px;
  z-index: 3;
  animation: flyingBird linear infinite;
}

.bird:before,
.bird:after {
  content: "";
  position: absolute;
  width: 100%;
  height: 100%;
  background-color: transparent;
  border-radius: 50%;
  border-top: 2px solid #333;
  top: 0;
}

.bird:before {
  left: -50%;
  transform-origin: right top;
  animation: wingLeft 0.5s infinite alternate;
}

.bird:after {
  left: 50%;
  transform-origin: left top;
  animation: wingRight 0.5s infinite alternate;
}

@keyframes wingLeft {
  from {
    transform: rotate(10deg);
  }
  to {
    transform: rotate(-10deg);
  }
}

@keyframes wingRight {
  from {
    transform: rotate(-10deg);
  }
  to {
    transform: rotate(10deg);
  }
}

@keyframes flyingBird {
  from {
    transform: translateX(-50px);
  }
  to {
    transform: translateX(calc(100vw + 50px));
  }
}

/* Enhanced starry background */
.starry-background {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 0;
  background: linear-gradient(125deg, #0f172a, #1e293b, #1a1f2e, #111827);
  background-size: 400% 400%;
  animation: gradientShift 30s ease infinite;
  overflow: hidden;
}

@keyframes gradientShift {
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

.star {
  position: absolute;
  background-color: #fff;
  border-radius: 50%;
  z-index: 1;
  animation: twinkle 5s infinite alternate, moveAcross 30s linear infinite;
}

@keyframes twinkle {
  0% {
    opacity: 0.2;
  }
  50% {
    opacity: 0.8;
  }
  100% {
    opacity: 0.2;
  }
}

@keyframes moveAcross {
  from {
    transform: translateX(0) translateY(0);
  }
  to {
    transform: translateX(-100px) translateY(20px);
  }
}

.shooting-star {
  position: absolute;
  width: 2px;
  height: 2px;
  background-color: white;
  z-index: 2;
  opacity: 0;
  transform: rotate(45deg);
  animation: shootingStar 8s linear infinite;
}

.shooting-star::before {
  content: "";
  position: absolute;
  width: 50px;
  height: 1px;
  background: linear-gradient(90deg, rgba(255, 255, 255, 0.8), transparent);
  transform: translateX(-100%);
}

@keyframes shootingStar {
  0% {
    opacity: 0;
    transform: translateX(0) translateY(0) rotate(315deg) scale(0);
  }
  2% {
    opacity: 1;
    transform: translateX(20px) translateY(20px) rotate(315deg) scale(1);
  }
  10% {
    opacity: 1;
    transform: translateX(200px) translateY(200px) rotate(315deg) scale(1);
  }
  12% {
    opacity: 0;
    transform: translateX(220px) translateY(220px) rotate(315deg) scale(0);
  }
  100% {
    opacity: 0;
    transform: translateX(220px) translateY(220px) rotate(315deg) scale(0);
  }
}

/* Make content appear above the background */
main,
nav,
header {
  position: relative;
  z-index: 10;
}

section {
  scroll-margin-top: 3rem;
  position: relative;
}

/* Add subtle parallax effect to sections */
section::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(
    15,
    23,
    42,
    0.7
  ); /* Match the body background but with transparency */
  backdrop-filter: blur(6px);
  z-index: -1;
  border-radius: 0.5rem;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
  margin: 1rem;
}

/* Custom gradient overlays for depth */
.section-gradient-1 {
  background: linear-gradient(
    135deg,
    rgba(5, 46, 22, 0.8) 0%,
    rgba(16, 185, 129, 0.05) 100%
  );
}

.section-gradient-2 {
  background: linear-gradient(
    135deg,
    rgba(16, 185, 129, 0.05) 0%,
    rgba(10, 41, 66, 0.8) 100%
  );
}

/* Add nebula-like effect in corners */
.starry-background::after {
  content: "";
  position: absolute;
  width: 300px;
  height: 300px;
  top: 80%;
  left: 80%;
  background: radial-gradient(
    circle,
    rgba(16, 185, 129, 0.2) 0%,
    transparent 70%
  );
  filter: blur(30px);
  z-index: 1;
  animation: nebulaPulse 15s ease-in-out infinite;
}

.starry-background::before {
  content: "";
  position: absolute;
  width: 250px;
  height: 250px;
  top: 10%;
  left: 5%;
  background: radial-gradient(
    circle,
    rgba(99, 102, 241, 0.15) 0%,
    transparent 70%
  );
  filter: blur(30px);
  z-index: 1;
  animation: nebulaPulse 20s ease-in-out infinite reverse;
}

@keyframes nebulaPulse {
  0% {
    opacity: 0.3;
    transform: scale(1);
  }
  50% {
    opacity: 0.6;
    transform: scale(1.2);
  }
  100% {
    opacity: 0.3;
    transform: scale(1);
  }
}

/* Fix for navbar */
nav {
  backdrop-filter: blur(10px);
}
</style>
