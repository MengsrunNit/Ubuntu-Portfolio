<template>
  <section id="about" class="py-16 px-4 md:px-8 bg-gray-900">
    <div class="max-w-5xl mx-auto text-center">
      <h2 class="section-title text-emerald-400 mb-12">
        Technical Skills
      </h2>

      <!-- Grouped Skill Icons -->
      <div class="space-y-12">
        <!-- Languages -->
        <div>
          <h4 class="font-medium text-emerald-400 mb-4">Languages</h4>
          <div class="flex flex-wrap justify-center gap-6">
            <img src="../assets/icons/python.svg" alt="Python" class="icon" />
            <img src="../assets/icons/java.svg" alt="Java" class="icon" />
            <img
              src="../assets/icons/javascript.svg"
              alt="JavaScript"
              class="icon"
            />
            <img src="../assets/icons/sql.svg" alt="SQL" class="icon" />
            <img src="../assets/icons/html.svg" alt="HTML" class="icon" />
            <img src="../assets/icons/css.svg" alt="CSS" class="icon" />
          </div>
        </div>

        <!-- Frameworks & Libraries -->
        <div>
          <h4 class="font-medium text-emerald-400 mb-4">
            Frameworks & Libraries
          </h4>
          <div class="flex flex-wrap justify-center gap-6">
            <img src="../assets/icons/vuejs.svg" alt="Vue" class="icon" />
            <img src="../assets/icons/nodejs.svg" alt="Node.js" class="icon" />
            <img src="../assets/icons/fastAPI.svg" alt="fastAPI" class="icon" />
          </div>
        </div>

        <!-- Tools & Technologies -->
        <div>
          <h4 class="font-medium text-emerald-400 mb-4">
            Tools & Technologies
          </h4>
          <div class="flex flex-wrap justify-center gap-6">
            <img src="../assets/icons/github.svg" alt="Git" class="icon" />
            <img src="../assets/icons/docker.svg" alt="Docker" class="icon" />
            <img src="../assets/icons/AWS.svg" alt="AWS" class="icon" />
            <img src="../assets/icons/mongodb.svg" alt="MongoDB" class="icon" />
            <img
              src="../assets/icons/PostgresSQL.svg"
              alt="PostgreSQL"
              class="icon"
            />
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.icon {
  height: 3.5rem;
  width: 3.5rem;
  transition: transform 0.3s ease, filter 0.3s ease;
}
.icon:hover {
  transform: scale(1.1);
  filter: drop-shadow(0 0 8px rgba(16, 185, 129, 0.6));
}
section {
  scroll-margin-top: 3rem;
}
</style>
