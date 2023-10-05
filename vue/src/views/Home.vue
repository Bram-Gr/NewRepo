<template>
  <div class="home">
    <h1>Welcome To Quizzical!</h1>
    <p>Browse Categories to Select a Quiz</p>

    <router-link class="link"
  :to="getQuizListRoute(category.categoryId, user.userId)"
  v-for="category in categories"
  :key="category.categoryId"
>
  <category :category="category" />
</router-link>




  </div>
</template>

<script>
import {mapState} from 'vuex';
import CategoryService from '../services/CategoryService';
import Category from '../components/Category';

export default {
  components: { Category },
  name: 'home',
  data() {
    return {
      category: '',
      categories: [],
      user:{}
    };
  },
  methods: {
  getQuizListRoute(categoryId, id) {
    if (categoryId === 6) {
      // If categoryId is 6, navigate to "userQuizList" with user.userId
      return { name: 'userQuizList', params: { id } };
    } else {
      // Otherwise, navigate to "quizList" with categoryId
      return { name: 'quizList', params: { categoryId } };
    }
   }
  },
  computed:{
     ...mapState('user',['userId'])
  },
  created() {
    CategoryService.getCategories().then((response) => {
      this.categories = response.data;
    });
    this.user.id = this.$store.state.user.id || '';
  },
};
</script>

<style scoped>

.link{
  text-decoration: none;
  text-transform: uppercase;
}
</style>
