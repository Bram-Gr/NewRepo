<template>
  <b-navbar id="main" toggleable="md" type="dark" class="navigation-menu navigation-container" :class="{ onScroll: !view.topOfPage }">
    <div  class="b-nav">
    <b-navbar-brand class="logo" to="/">QUIZZICAL</b-navbar-brand>
    <sub-nav v-show="!view.topOfPage" class="bread-crumb"/>
  </div>
    <b-navbar-toggle class="navbar-toggler-icon" target="nav-collapse">::</b-navbar-toggle>

    <b-collapse  class="navigation-menu-labels" is-nav id="nav-collapse">
      <b-navbar-nav class="ml-auto">
        <b-nav-item class="ml-auto" @click="resetToggle"><router-link to="/about">ABOUT</router-link></b-nav-item>
        <b-nav-item  v-if="$store.state.token !== '' && displayLogout" @click="resetToggle">
          <router-link class="nav-button" to="/logout">LOGOUT</router-link>
        </b-nav-item>
        <b-nav-item v-else-if="displayLogin" @click="resetToggle">
          <router-link class="nav-button" to="/login">LOGIN</router-link>
        </b-nav-item>
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
</template>

  
  <script>
  import { BNavbar, BNavbarBrand, BNavbarToggle, BNavbarNav, BNavItem  } from 'bootstrap-vue';
  
import SubNav from './SubNav.vue';
  export default {
   
    components:{BNavbar, BNavbarBrand, BNavbarToggle, BNavbarNav, BNavItem, SubNav},
    name: "NavigationComponent",
    data() {
      return {
       
       
        checkbox: false,
        view: {
          topOfPage: true,
        },
      };
    },
    beforeMount() {
      window.addEventListener("scroll", this.handleScroll);
    },
  
    methods: {
         handleScroll() {
        if (window.scrollY >= 100) {
          if (this.view.topOfPage) this.view.topOfPage = false ;
        } else {
          if (!this.view.topOfPage) this.view.topOfPage = true;
        }
      },
      resetToggle() {
        const menu = document.getElementById("main");
        menu.classList.remove("toggled-true");
        this.checkbox = true;
        this.toggleMenu();
      },
      toggleMenu() {
        this.checkbox = !this.checkbox;
  
        const toggleMenu = document.getElementById("toggleMenu");
        const menu = document.getElementById("main");
  
        toggleMenu.checked = this.checkbox;
  
        toggleMenu.addEventListener("change", function () {
          if (toggleMenu.checked) {
            menu.classList.add("toggled-true");
          } else {
            menu.classList.remove("toggled-true");
          }
        });
      },
    },
    computed: {
    displayLogout() {
  return this.$route.path !== "login"
    },
    displayLogin() {
        return this.$route.path !== "logout"
    },
  }
  };
  </script>
  
  <style scoped>

.navbar-toggler-icon{
  color: black;
}
  .b-nav{
    display:flex;
    flex-direction: row;
    flex-wrap: wrap;
  }
  .bread-crumb{
    display: flex;
    justify-content: flex-end;
    align-items:flex-end;
  }

  .navbar-expand-md .navbar-collapse {
    text-align: right;
    justify-content: flex-end;
    display: flex;
    /* flex-basis: auto; */
}
  .navigation-menu-labels{
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
    top:0;
    left:0;
    max-width: 100%;
    margin: 0;
    padding: 50px;
    z-index: 1;
    width: 100%;
    position:fixed;
  }
  
  .navigation-menu {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-between;
    padding-block: 15px;
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
    /* background: transparent;  */
  }
  .onScroll {
    background: white;
  }
  .navigation-menu a {
    text-decoration: none;
    color: black;
  }
  .navigation-menu button {
    text-decoration: none;
    border: none;
   
  }
  .logo{
  font-size: 2rem;
  font-weight: bold;
}
  
  
  .navigation-menu-labels {
    list-style: none;
    display: flex;
    gap: 25px;
    align-items: flex-end;
  }

  /* .navigation-menu-labels > li > a:hover  {
 cursor: pointer;
  } */

  
  #toggleMenu,
  .navigation-menu label {
    display: none;
    
  }
  
  @media screen and (max-width: 768px) {

    .navbar-expand-md .navbar-collapse {
      /* background: linear-gradient(to bottom, #0a0b0a, #0c0c0c);  */
    text-align: left;
    justify-content: flex-start;
    display: flex;
    
    /* flex-basis: auto; */
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
  
    #toggleMenu:checked ~ .main-menu {
      max-height: 75rem;
    }
  }
  </style>