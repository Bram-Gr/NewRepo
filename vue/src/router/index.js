import Vue from 'vue'
import Router from 'vue-router'
import SelectQuiz from '../views/SelectQuiz.vue'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import store from '../store/index'
import Quizzes from '../views/Quizzes.vue'
import Quiz from '../views/Quiz.vue'

Vue.use(Router)


const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/select-page',
      name: 'select',
      component: SelectQuiz,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },

    {
      path: "/categories/:categoryId",
      name: "quizList",
      component: Quizzes,
      meta: {
        requiresAuth: false
      }
    },
    {
      path:"/user-categories/:id",
      name:"userQuizList",
      component: Quizzes,
      meta:{
        requiresAuth: true
      }
    },
    {
      path: "/categories/:quizId/quizzes",
      name: "Quiz",
      component: Quiz,
      meta: {
        requiresAuth: false
      }
    }
  ]})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
