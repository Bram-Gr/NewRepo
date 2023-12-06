<template>
    <nav
      id="main"
      class="navigation-menu navigation-container"
      :class="{ onScroll: !view.topOfPage }"
    >
    <router-link class="logo" v-bind:to="{ name: 'home' }"
        >QUIZZICAL </router-link
      >
  
      <input type="checkbox" id="toggleMenu" @click="toggleMenu" />
      <label for="toggleMenu"><i class="fa fa-bars" id="toggleIcon"></i></label>
      <section class="main-menu">
        <ul class="navigation-menu__labels">
          <li @click="resetToggle()">
            <router-link  v-bind:to="{ name: 'about' }">
              ABOUT
            </router-link>
          </li>
          <li         v-if="$store.state.token != '' && displayLogout" @click="resetToggle()">
            <router-link
        class="nav-button"
        v-bind:to="{ name: 'logout' }"

      >LOGOUT</router-link
      >
    
          </li>
          <li   v-else-if="displayLogin" @click="resetToggle()">
            <router-link
        class="nav-button"
        v-bind:to="{ name: 'login' }"
      
      >
     LOGIN</router-link
      >
            </li>
        </ul>
      </section>
    </nav>
  </template>
  
  <script>
  
  export default {
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
        if (window.scrollY > 100) {
          if (this.view.topOfPage) this.view.topOfPage = false;
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
  .navigation-menu__labels{
    font-size: 1.5rem;
  }
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    color:white;
  }
  
  body {
    margin: 0;
    padding: 0;
    background-color: #fdfefe;
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
    background-color: transparent;
    padding-block: 15px;
  }
  .onScroll {
    background: black;
  }
  .navigation-menu a {
    text-decoration: none;
    color: #fdfefe;
  }
  .navigation-menu button {
    text-decoration: none;
    color: #fdfefe;
    border: none;
    background-color: transparent;
  }
  .logo{
  font-size: 2rem;
  font-weight: bold;
}
  
  
  .navigation-menu__labels {
    list-style: none;
    display: flex;
    gap: 25px;
    align-items: flex-end;
  }

  .navigation-menu__labels > li > a:hover  {
 cursor: pointer;
  }

  
  #toggleMenu,
  .navigation-menu label {
    display: none;
    
  }
  
  @media screen and (max-width: 768px) {
    .main-menu {
      width: 100%;
      max-height: 0;
      overflow: hidden;
      opacity: 1;
    }
    .navigation-container{
  
    background-color: #353631;
    }
    .navigation-menu label {
      display: inline-flex;
      align-items: flex-start;
      cursor: pointer;
      color: #fdfefe;
    }
  
    .navigation-menu__labels {
      flex-direction: column;
      align-items: flex-start;
      margin-top: 10px;
      padding: 20px;
    }
  
    #toggleMenu:checked ~ .main-menu {
      max-height: 75%;
    }
  }
  </style>