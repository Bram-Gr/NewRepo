<template>
  <div id="app">
    <div id="nav">
  <nav-bar />
  </div>  
  
  <b-breadcrumb class="bread-crumb" :items="items"></b-breadcrumb>
    <router-view />
   
  </div>
</template>
<script>
import { BBreadcrumb } from 'bootstrap-vue'
import navBar from "./components/NavBar"
export default {
  components: {navBar, BBreadcrumb},
  data() {
    return {
      items: [
          {
            text: 'Select',
            to:{name: 'select'}
          },
          {
            text: 'Quizzes',
            to:{name:"userQuizList"}
          },
          {
            text: 'Quiz',
            to:{name: "Quiz"}
          }
        ]
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