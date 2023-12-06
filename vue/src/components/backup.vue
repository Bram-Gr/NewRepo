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