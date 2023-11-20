<template>
    <nav id="main" :class="{ onScroll: !view.topOfPage }">
      <div class="logo">QUIZZICAL</div> &nbsp; &nbsp;
      <div class="nav-buttons">
      <a class="back" v-if="displayBackButton" @click="goBack">Back | </a>&nbsp;
      <router-link class="nav-button" v-bind:to="{ name: 'home' }"
        >Home </router-link
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
      return this.$route.path === "/";
    },
    displayLogin() {
      return this.$route.path === "/";
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
  align-items: flex-end;
  justify-content: flex-start;
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

}
.logo{
  font-size: 2rem;
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
.back {
  text-decoration: none;
  color: white;
  font-size: 1.5rem;
}
</style>