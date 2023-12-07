<template>
  <div class="quiz-page-main">
  <div class="quizzes">
    <h1 v-if="category">{{ category }}</h1>
    <h1 v-else>CUSTOM</h1>
  
      <div v-if="routeParamsCheck">
    <b-button block variant="primary"  @click="openModal">Create Quiz</b-button>
    <create-quiz v-if="isModalOpen" @click="closeModal" @closeModal="closeModal"/>
  </div>
  <h1 v-if="routeParamsCheck" class="user-q" >{{ name.toUpperCase() }}'S QUIZZES</h1>
  <div  v-if="routeParamsCheck" class="quizzes-list">
  
    <quiz-list class="quiz-list" v-for="(uniqueQuiz, index) in quizzes.slice().reverse()" :key="index" :quiz="uniqueQuiz" />  
  </div>

  <div class="q-quiz" v-else>
    <quiz-list class="quiz-list" v-for="(uniqueQuiz, index) in quizzes" :key="index" :quiz="uniqueQuiz" />  
  </div>
  
 
  </div>
</div>
</template>

<script>

import quizList from "../components/QuizList";
import quizService from "../services/QuizService";
import createQuiz from "../components/CreateQuiz"
import CategoryService from '../services/CategoryService';
export default {
  components: { quizList, createQuiz },
  data() {
    return {
      category: this.categoryName,
      quiz: {},
      quizzes: [],
      isModalOpen: false,
      name:this.$store.state.user.username
    };
  },
  methods: {
    // updateBackgroundSize() {
    //   const containerHeight = document.getElementById('app-container').offsetHeight;
    //   document.body.style.backgroundSize = `100% 100% ${containerHeight}px`;
    // },
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

 CategoryService.getCategories().then((response) => {
  console.log(response.data);

  const categoryData = response.data[this.$route.params.categoryId-1];

  if (categoryData && categoryData.categoryName) {
    this.category = categoryData.categoryName.toUpperCase();
  } else {
    // Handle the case where categoryData or categoryName is undefined
    console.error(`Category with ID ${this.$route.params.categoryId} not found or does not have a valid name.`);
  }
});

    // this.updateBackgroundSize();

    // // Call the function whenever the window is resized
    // window.addEventListener('resize', this.updateBackgroundSize);
    try {
      const routeParams = this.$route.params;

      if ('id' in routeParams) {
        // If userId is in routeParams, use getQuizzesByUserId
        quizService.getQuizzesByUserId(routeParams.id).then((response) => {
          this.quizzes = response.data;
        });
      } else if ('categoryId' in routeParams) {
        // If categoryId is in routeParams, use getQuizzesByCategoryId
        quizService.getQuizzesByCategoryId(routeParams.categoryId).then((response) => {
          this.quizzes = response.data;
        });
      } else {
        // Handle the case where neither userId nor categoryId is present
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
h1.user-q{
  text-decoration: none;
  color: black;
}
.q-quiz{
  margin-top: 2rem;
  /* color: white; */
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}
.create-form{  
flex-wrap: wrap;
margin-left:2rem;
}
h1{
  padding-top: 2rem;
  color:black;
  display: flex;
  justify-content: center;
}
.create-button{
  margin-top:1.26rem;
}
.create-button, .user-q{
  font-weight:bold;
  color: white;
  background: none;
  border: none;
  cursor: pointer;
  font-size: 2rem;
  text-decoration: underline;
}
.quizzes-list{
  justify-content: center;
  display: flex;
  margin-top:2rem;
  padding:.5rem;
  margin-left:2rem;
color: white;
/* background: rgba(255, 253, 253, 0.00);
box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25); */
}
.quiz-list{
  padding: .6rem;
}
.quiz-page-main{
  margin-top:8rem;
}
.quiz-page{
  color: white;
  display:flex;
  flex-wrap: wrap;
  margin-top:2rem;
  /* margin: 5rem; */
  justify-content: center;
}
.quizzes{
 height: 100vh;
}
h1.name{
  color: black;
}
</style>