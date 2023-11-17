<template>
  <div class="quiz-page">
  <div class="quizzes">
    <h1>GET QUIZZICAL</h1>
    <quiz-list class="quiz-list" v-for="(uniqueQuiz, index) in quizzes" :key="index" :quiz="uniqueQuiz" />

    <div  v-if="routeParamsCheck">
    <button  @click="openModal">Create Quiz</button>
    <create-quiz v-if="isModalOpen" @click="closeModal" @closeModal="closeModal"/>
   </div>
  
  </div>
</div>
</template>

<script>
import quizList from "../components/QuizList";
import quizService from "../services/QuizService";
import createQuiz from "../components/CreateQuiz"
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
      this.isModalOpen = true; // Open the modal
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
  created(){
    window.scrollTo(0, 0);
  }
};
</script>

<style scoped>

h1{
  display: flex;
  justify-content: center;
}
.quiz-list{
border-radius: 52px;
border-left: 4px solid #FFF;

background: rgba(255, 253, 253, 0.00);
font-family: 'Permanent Marker', cursive;
box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
}

.quiz-page{
  margin: 5rem;

}
.quizzes{
 height: 100vh;
}
</style>