<template>
  <div>
    <h1>Select Quiz</h1>
    <quiz-list v-for="(uniqueQuiz, index) in uniqueQuizzes" :key="index" :quiz="uniqueQuiz" />

    <div  v-if="routeParamsCheck">
    
    <create-quiz ref="quizModal" />
    <button @click="openModal">Create Quiz</button>
  </div>
  
  </div>
</template>

<script>
import quizList from "../components/QuizList.vue";
import quizService from "../services/QuizService";
import createQuiz from "../components/CreateQuiz.vue"
export default {
  components: { quizList, createQuiz },
  data() {
    return {
      quiz: {},
      quizzes: [],
      isModalOpen: false
    };
  },
  methods: {
    openModal() {
      this.$refs.quizModal.openModal();
    },
    closeModal() {
      this.isModalOpen = false; // Close the modal
    },
  },
  computed: {
    uniqueQuizzes() {
      // Use a Set to store unique quiz names
      const uniqueNames = new Set();

      // Filter out duplicate quiz names and store in an array
      const filteredQuizzes = this.quizzes.filter((quiz) => {
        if (!uniqueNames.has(quiz.quizName)) {
          uniqueNames.add(quiz.quizName);
          return true;
        }
        return false;
      });

      return filteredQuizzes;
    },
    routeParamsCheck(){
      return "id" in this.$route.params;
    }
  },
  mounted() {
    try {
      const routeParams = this.$route.params;

      if ('id' in routeParams) {
        // If userId is in routeParams, use getQuizzesByUserId
        quizService.getQuizzesByUserId(routeParams.id).then((response) => {
          this.quizzes = response.data;
          console.log(response.data);
        });
      } else if ('categoryId' in routeParams) {
        // If categoryId is in routeParams, use getQuizzesByCategoryId
        quizService.getQuizzesByCategoryId(routeParams.categoryId).then((response) => {
          this.quizzes = response.data;
          console.log(response.data);
        });
      } else {
        // Handle the case where neither userId nor categoryId is present
        console.error('Invalid route parameters');
      }
    } catch (error) {
      console.error(error);
    }
  },
};
</script>

<style>
</style>