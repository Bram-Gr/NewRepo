<template>
  <div id="app">
    <div id="nav">
  <nav-bar />
  </div>  
    <router-view />
  </div>
</template>
<script>
import navBar from "./components/NavBar"
export default {
  components: {navBar},
  data() {
    return {
     
    };
  }

};
</script>
<style >

#nav{
 display: inline-block;
}
#app {
  height: 100vh;
  /* Other styles */
}

</style>