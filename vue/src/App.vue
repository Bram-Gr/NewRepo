<template>
  <div id="app">
    <div id="nav">
      <a v-if="displayBackButton" @click="goBack">Back | </a>
      <router-link class="nav-button" v-bind:to="{ name: 'home' }">Home</router-link>
      <router-link class="nav-button" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != '' && displayLogout"> | Logout</router-link>
      <router-link class="nav-button" v-bind:to="{ name: 'login' }" v-else-if="displayLogin"> | Login</router-link>
    </div>
    <router-view />
  </div>
</template>
<script>
export default {
  data(){
    return{

    }
  },
  methods:{
    goBack(){
      this.$router.back();
    }
  },
  computed:{
    displayBackButton(){
      return this.$route.path !== '/'; 
    },
    displayLogout(){
      return this.$route.path === '/'
    },
    displayLogin(){
      return this.$route.path === '/'
    }
  }
}
</script>
<style scoped>
.nav-button{
  text-decoration: none;
  color: black;
}
</style>