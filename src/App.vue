<template>
   <TopBar />
   <Home/>
 
  <navbar />


  
</template>

<script>
import AboutMe from './components/AboutMe.vue';
import ContactMe from './components/ContactMe.vue';
import Home from './components/Home.vue';
import Projects from './components/Projects.vue';
import Navbar from './components/NavBar.vue';
import TopBar from './components/TopBar.vue';

export default{
  name: 'App', 
  components:{
    AboutMe,
    ContactMe,
    Home,
    Projects,
    Navbar,
    TopBar 

  }
}

</script>



<style >

</style>
