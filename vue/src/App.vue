<template>
  <div id="app">


    
    <div id="nav">
  <nav-bar />
  </div>  
  
  <sub-nav v-show="sub" class="bread-crumb" />
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
     sub:true,
     view: {
          topOfPage: true,
        }
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
    
  },
  methods: {
  handleScroll() {
    if (window.scrollY >= 100) {
          if (this.view.topOfPage) this.view.topOfPage = false ;
          this.sub = false
        } else {
          if (!this.view.topOfPage) this.view.topOfPage = true;
          this.sub = true
        }
  },
},
mounted() {
  window.addEventListener("scroll", this.handleScroll);
},
beforeDestroy() {
  window.removeEventListener("scroll", this.handleScroll);
},

};
</script>
<style scoped>
.bread-crumb{
  z-index: 1;
  position:absolute;
  top: 100px;    
    left: 190px;
}
#nav{
 display: inline-block;

}
#app {
  height: 100vh;
  /* Other styles */
}

</style>