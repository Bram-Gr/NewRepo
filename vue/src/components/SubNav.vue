<template>
  <div>
    <b-breadcrumb>
      <b-breadcrumb-item :to="{ name: 'select' }" :active="false">Categories</b-breadcrumb-item>
      <b-breadcrumb-item  @click="goToPreviousRoute" :active="isBreadcrumbActive('quizList')">Quizzes</b-breadcrumb-item>
      <b-breadcrumb-item :to="{ name: 'Quiz' }" :active="isBreadcrumbActive('Quiz')">Quiz</b-breadcrumb-item>
    </b-breadcrumb>
  </div>
</template>

<script>
// import quizService from '../services/QuizService';
export default {
  data() {
    return {
      active: true,
   
    };
  },
  methods: {
 
    goToPreviousRoute() {
      if(this.$route.name ==='Quiz'){
      this.$router.go(-1);
    }
    },
    isBreadcrumbActive(breadcrumbName) {
      // Logic to determine if the breadcrumb is active based on the current route
      const currentRoute = this.$route.name;

      if (currentRoute === 'Quiz') {
        return false; // Set all breadcrumbs to false when the current route is Quiz
      } else if ((currentRoute === 'quizList' || currentRoute === 'userQuizList') && (breadcrumbName === 'select' || breadcrumbName === 'quizList')) {
        return false; // Set to false for select and quizList when the current route is quizList
      } else if (currentRoute !== breadcrumbName) {
        return true; // Set to true for all other cases
      }

      return true;
    },
  }
};
</script>
<style scoped>
a{
  text-decoration: none;
  color:white;
}
</style>