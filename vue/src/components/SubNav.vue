<template>
    <div>
 
    <b-breadcrumb>
      <!-- Top-level select -->
    
      <b-breadcrumb-item :to="{ name: 'select' }" @change="handleTopLevelChange">Select</b-breadcrumb-item>
 
  
      <!-- Second-level quizzes -->
      <b-breadcrumb-item :to="{ name: 'Quizzes', params: {categoryId} }">Quizzes</b-breadcrumb-item>
  
      <!-- Third-level quiz -->
      <b-breadcrumb-item :to="{ name: 'Quiz', params: { quizId: currentQuizId } }">{{ currentQuizName }}</b-breadcrumb-item>
    </b-breadcrumb>
</div>
  </template>
  
  <script>

  export default {

    components: {
    
    },
    data() {
      return {
        categoryId: this.$store.state.quiz.categoryId || "",
        quiz: this.$store.state.quiz,
        currentQuizId:'',
        currentQuizName: '',
      };
    },
    methods: {
      handleTopLevelChange(selectedValue) {
        // Handle the change in the top-level select
        // Update currentQuizId and currentQuizName based on the selectedValue
        this.currentQuizId = selectedValue.id;
        this.currentQuizName = selectedValue.name;
      },
    },
  };
  </script>
  
<style scoped>

</style>