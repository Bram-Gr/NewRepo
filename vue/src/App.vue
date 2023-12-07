<template>
  <div id="app">
    <div id="nav">
  <nav-bar />
  </div>  
  
  <sub-nav class="bread-crumb" />
    <router-view />
   
  </div>
</template>
<script>
import  SubNav  from './components/SubNav'
import NavBar from "./components/NavBar"
export default {
  components: {NavBar, SubNav},
  data() {
    return {
     
      // items: [
      //     {
      //       text: 'Select',
      //       to:{name: 'select'}
      //     },
      //     {
      //       text: 'Quizzes',
      //       to:{path: "/categories/:categoryId"}
      //     },
      //     {
      //       text: 'Quiz',
      //       to:{path: "/categories/:quizId/quizzes"}
      //     }
      //   ]
        }
    
  }

};
</script>
<style scoped>
.bread-crumb{
  
  position:absolute;
  top: 100px;    
    left: 150px;
}
#nav{
 display: inline-block;

}
#app {
  height: 100vh;
  /* Other styles */
}

</style>