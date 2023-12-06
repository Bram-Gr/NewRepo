import Vue from 'vue';
import App from './App.vue';
import router from './router/index';
import store from './store/index';
import axios from 'axios';
import style from './assets/styles.css';

import BootstrapVue from 'bootstrap-vue'
import  'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)
Vue.config.productionTip = false
// Vue.use(modal)
axios.defaults.baseURL = process.env.VUE_APP_REMOTE_API;

new Vue({
  style,
  router,
  store,
  render: h => h(App)
}).$mount('#app')
