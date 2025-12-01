# 👨‍💻 Mengsrun Nit - Portfolio Website

![Vue.js](https://img.shields.io/badge/vuejs-%2335495e.svg?style=for-the-badge&logo=vuedotjs&logoColor=%234FC08D)
![TailwindCSS](https://img.shields.io/badge/tailwindcss-%2338B2AC.svg?style=for-the-badge&logo=tailwind-css&logoColor=white)
![Vite](https://img.shields.io/badge/vite-%23646CFF.svg?style=for-the-badge&logo=vite&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)

A modern, high-performance personal portfolio website built with **Vue 3** and **Tailwind CSS**. This project features a unique **Ubuntu/GNOME-inspired user interface**, dynamic day/night atmospheric animations, and a production-ready Dockerized infrastructure served via Nginx.

---

## ✨ Key Features

### 🎨 UI & UX
- **Dynamic Theming:** A robust Dark/Light mode system that goes beyond simple color swaps.
  - **Dark Mode:** Features an animated starry night sky, shooting stars, a glowing moon, and silhouette trees.
  - **Light Mode:** Features a bright sky gradient, floating clouds, flying birds, and a pulsing sun.
- **GNOME-Style Top Bar:** A functional replica of the Ubuntu/GNOME desktop top bar (`TopBar.vue`) containing:
  - **Activities:** A quick-launch app drawer.
  - **System Tray:** Interactive mockups for Wi-Fi, Bluetooth, Volume, and Battery status.
  - **Clock:** Real-time date and time display.
- **Responsive Design:** Fully adaptive layout that switches between a desktop navigation bar and a mobile-optimized slide-out menu.

### ⚡ Technical Features
- **SPA Architecture:** Single Page Application built with Vite for lightning-fast HMR (Hot Module Replacement) and bundling.
- **SEO Optimized:** Includes Open Graph tags, Twitter Cards, and JSON-LD structured data for rich search results.
- **Contact Form:** Integrated with **Formspree** for serverless email handling, including honeypot bot protection.
- **Performance:** Assets are compressed (Gzip) and cached aggressively via Nginx configuration.

---

## 🛠️ Tech Stack

| Category | Technology | Description |
|----------|------------|-------------|
| **Frontend Framework** | [Vue 3](https://vuejs.org/) | Composition API, `<script setup>` syntax. |
| **Build Tool** | [Vite](https://vitejs.dev/) | Next-generation frontend tooling. |
| **Styling** | [Tailwind CSS](https://tailwindcss.com/) | Utility-first CSS framework. |
| **Icons** | SVG / Custom | Inline SVGs for optimal performance. |
| **Server** | [Nginx](https://nginx.org/) | High-performance HTTP server and reverse proxy. |
| **Containerization** | [Docker](https://www.docker.com/) | Multi-stage build for production deployment. |

---

## 🏗️ Infrastructure & Build Process

This project uses a **Multi-Stage Docker Build** to ensure the final image is lightweight and secure.

### 1. The Dockerfile Strategy
The `Dockerfile` is split into two distinct stages:

1.  **Build Stage (`node:20-alpine`)**:
    *   Installs dependencies using `npm ci` (clean install) for reproducibility.
    *   Runs the Vite build process (`npm run build`).
    *   Generates the static assets in the `/dist` folder.
    *   *Note: This stage is discarded in the final image, keeping the image size small.*

2.  **Serve Stage (`nginx:1.27-alpine`)**:
    *   Uses the lightweight Alpine Linux version of Nginx.
    *   Copies the compiled static files from the **Build Stage** into `/usr/share/nginx/html`.
    *   Copies the custom `nginx.conf` to handle routing and caching.

### 2. Nginx Configuration (`nginx.conf`)
The server configuration is tuned for SPA performance:

*   **SPA Fallback:** The `location /` block uses `try_files $uri $uri/ /index.html;`. This ensures that if a user refreshes the page on a specific route (e.g., `/projects`), Nginx serves `index.html` so Vue Router can handle the view, preventing 404 errors.
*   **Asset Caching:**
    *   Files in `/assets/` are hashed by Vite (e.g., `index.a1b2c3.js`).
    *   Nginx is configured with `expires 1y` and `Cache-Control "public, immutable"`. This tells browsers to cache these files indefinitely, drastically speeding up repeat visits.
*   **Compression:** Gzip is enabled for text, CSS, JS, and SVG files to reduce bandwidth usage.

---

## 🚀 Getting Started

### Prerequisites
- Node.js (v18 or v20 recommended)
- npm

### Local Development

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/ubuntu-portfolio.git
    cd ubuntu-portfolio
    ```

2.  **Install dependencies:**
    ```bash
    npm install
    ```

3.  **Run the development server:**
    ```bash
    npm run dev
    ```
    Open `http://localhost:5173` in your browser.

### Production Build (Local)

To preview the production build locally without Docker:

```bash
npm run build
npm run preview
```

---

## 🐳 Docker Deployment

To build and run the containerized version of the portfolio:

1.  **Build the Image:**
    ```bash
    docker build -t my-portfolio .
    ```

2.  **Run the Container:**
    ```bash
    docker run -d -p 8080:80 --name portfolio-container my-portfolio
    ```

3.  **Access the site:**
    Open `http://localhost:8080`.

---

## 📂 Project Structure

```text
.
├── Dockerfile              # Multi-stage build definition
├── nginx.conf              # Nginx server configuration
├── index.html              # Entry point (SEO & Meta tags)
├── package.json            # Dependencies & Scripts
├── vite.config.js          # Vite configuration
├── tailwind.config.js      # Tailwind configuration
├── public/                 # Static assets (favicons, etc.)
└── src/
    ├── main.js             # App entry point
    ├── App.vue             # Root component (Theme logic & Backgrounds)
    ├── style.css           # Global styles
    ├── assets/             # CSS, Images, Icons
    └── components/
        ├── Navbar.vue      # Main navigation
        ├── TopBar.vue      # GNOME-style system bar
        ├── Home.vue        # Hero section
        ├── AboutMe.vue     # Skills section
        ├── Experience.vue  # Timeline section
        ├── Projects.vue    # Project grid & Modals
        ├── ContactMe.vue   # Formspree contact form
        └── FooterSection.vue
```

---

## 👤 Author

**Mengsrun Nit**
- 🌐 Website: [mengsrun-nit.com](https://mengsrun-nit.com)
- 🐙 GitHub: [@mengsrunnit](https://github.com/mengsrunnit)
- 💼 LinkedIn: [Mengsrun Nit](https://www.linkedin.com/in/mengsrunnit)

---

## 📄 License

This project is open source and available under the MIT License.
