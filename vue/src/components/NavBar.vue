<template>
  <b-navbar
    id="main"
    toggleable="md"
    type="light"
    class="navigation-menu navigation-container"
    :class="{ onScroll: !view.topOfPage }"
  >
    <div class="b-nav">
      <b-navbar-brand v-if="fullWidth" class="logo" to="/"
        >QUIZZICAL</b-navbar-brand
      >
      <b-navbar-brand v-else class="logo" to="/">Q</b-navbar-brand>
      <sub-nav v-show="!view.topOfPage" class="bread-crumb" />
    </div>
    <b-navbar-toggle class="navbar-toggler-icon" target="nav-collapse"
      >&nbsp;</b-navbar-toggle
    >

    <b-collapse class="navigation-menu-labels" is-nav id="nav-collapse">
      <b-navbar-nav class="ml-auto">
        <b-nav-item class="ml-auto"
          ><b-link to="/about">ABOUT</b-link></b-nav-item
        >
        <b-nav-item
          v-if="$store.state.token !== '' && displayLogout"         
        >
          <b-link class="nav-button" to="/logout">LOGOUT</b-link>
        </b-nav-item>
        <b-nav-item v-else-if="displayLogin">
          <router-link class="nav-button" to="/login">LOGIN</router-link>
        </b-nav-item>
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
</template>

  
  <script>
import {
  BLink,
  BNavbar,
  BNavbarBrand,
  BNavbarToggle,
  BNavbarNav,
  BNavItem,
} from "bootstrap-vue";

import SubNav from "./SubNav";
export default {
  components: {
    BLink,
    BNavbar,
    BNavbarBrand,
    BNavbarToggle,
    BNavbarNav,
    BNavItem,
    SubNav,
  },
  name: "NavigationComponent",
  data() {
    return {
      fullWidth: true,
      checkbox: false,
      view: {
        topOfPage: true,
      },
    };
  },
  beforeMount() {
    window.addEventListener("scroll", this.handleScroll);
  },
  mounted() {
    this.getFullWidth();
    window.addEventListener("resize", this.handleResize);
  },
  beforeDestroy() {
    this.getFullWidth();
    window.removeEventListener("resize", this.handleResize);
  },
  methods: {
    getFullWidth() {
      this.fullWidth = window.innerWidth > 500;
    },
    handleResize() {
      this.getFullWidth();
    },
    handleScroll() {
      if (window.scrollY >= 100) {
        if (this.view.topOfPage) this.view.topOfPage = false;
      } else {
        if (!this.view.topOfPage) this.view.topOfPage = true;
      }
    }
  },
  computed: {
    displayLogout() {
      return this.$route.path !== "login";
    },
    displayLogin() {
      return this.$route.path !== "logout";
    },
  },
};
</script>
  
  <style scoped>
.b-nav {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
.bread-crumb {
  margin-top: 1.2rem;
  display: flex;
  justify-content: flex-end;
  align-items: flex-end;
  padding-bottom: 0rem;
}
.navbar-expand-md .navbar-collapse {
  text-align: right;
  justify-content: flex-end;
  display: flex;
}
.navigation-menu-labels {
  font-size: 1.5rem;
}
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
body {
  margin: 0;
  padding: 0;
  font-family: "Cambria";
  font-size: 18px;
}
.navigation-container {
  top: 0;
  left: 0;
  max-width: 100%;
  margin: 0;
  padding: 50px;
  z-index: 1;
  width: 100%;
  position: fixed;
}
.navigation-menu {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-between;
  padding-block: 15px;
}
#main {
  padding-right: 0.3rem;
  padding-left: 0.3rem;
  padding-bottom: 0rem;
  z-index: 1;
  top: 0;
  width: 100%;
  display: inline-block;
  display: flex;
  flex-direction: row;
  position: fixed;
  flex-wrap: wrap;
}
.onScroll {
  background: white;
  border-bottom: 1px solid black;
  box-shadow: 0 2px 2px rgba(91, 137, 189, 0.7);
}
.navigation-menu a {
  padding: 0rem;
  font-size: 1.2rem;
  text-decoration: none;
  color: black;
}
.b-nav > .logo {
  font-size: 2rem;
}
.navigation-menu button {
  text-decoration: none;
  border: none;
}
.logo {
  padding-right:.1rem;
  font-size: 2rem;
  font-weight: bold;
}
.navigation-menu-labels {
  list-style: none;
  display: flex;
  gap: 25px;
  align-items: flex-end;
}
.navigation-menu label {
  display: none;
}

@media screen and (max-width: 768px) {
  .navbar-expand-md .navbar-collapse {
    /* text-align: left; */
    /* justify-content: flex-start; */
    display: flex;
  }
  .main-menu {
    width: 100%;
    max-height: 0;
    overflow: hidden;
    opacity: 1;
  }

  .navigation-menu label {
    display: inline-flex;
    align-items: flex-start;
    cursor: pointer;
  }

  .navigation-menu__labels {
    flex-direction: column;
    align-items: flex-start;
    margin-top: 10px;
    padding: 20px;
  }
}
</style>