<template>
    <nav id="main" :class="{ onScroll: !view.topOfPage }">
      <a  v-if="displayBackButton" @click="goBack"></a>
      <router-link class="logo" v-bind:to="{ name: 'home' }"
        >QUIZZICAL </router-link
      >&nbsp;&nbsp;&nbsp;
      <div class="nav-buttons">
      <a class="back" v-if="displayBackButton" @click="goBack">Back | </a>&nbsp;
      <router-link class="nav-button" v-bind:to="{ name: 'select' }"
        >Select Quiz </router-link
      > &nbsp;
      <router-link
        class="nav-button"
        v-bind:to="{ name: 'logout' }"
        v-if="$store.state.token != '' && displayLogout"
      >
        | Logout</router-link
      >
      <router-link
        class="nav-button"
        v-bind:to="{ name: 'login' }"
        v-else-if="displayLogin"
      >
        | Login</router-link
      >
    </div>
    </nav>
</template>

<script>
export default {
  
  data() {
    return {
      view: {
        topOfPage: true,
      },
    };
  },
 
  methods: {
    handleScroll() {
      if (window.pageYOffset > 100) {
        if (this.view.topOfPage) this.view.topOfPage = false;
      } else {
        if (!this.view.topOfPage) this.view.topOfPage = true;
      }
    },
    goBack() {
      this.$router.back();
    },
  },
  beforeMount() {
    window.addEventListener("scroll", this.handleScroll);
  },
  computed: {
    displayBackButton() {
      return this.$route.path !== "/";
    },
    displayLogout() {
      return this.$route.path === "/" || "select";
    },
    displayLogin() {
      return this.$route.path === "/" || "select";
    },
  }
};
</script>
<style scoped>
.onScroll{
  background: black;
}
.nav-buttons{
  display: flex;
  flex-wrap: wrap;
  padding-right: 0.5rem;
    padding-top: 0.3rem;
    position: fixed;
    right: 0;
}

#main{
  z-index: 1;
  top: 0;
  padding: 1rem;
  width: 100%;
  display: inline-block;
  display: flex;
  flex-direction: row;
  position:fixed;
 flex-wrap: wrap;
}
.logo{
  font-size: 2rem;
  font-weight: bold;
}

.back:hover {
  cursor: pointer;
}
/* .back:hover::before{
  content: "Back"; will position the word Back under the icon when switching to icons.
  position: absolute;
  top: 2.3rem
} */
.nav-button,
.back, .logo {
  text-decoration: none;
  color: white;
  font-size: 1.5rem;
}
</style>