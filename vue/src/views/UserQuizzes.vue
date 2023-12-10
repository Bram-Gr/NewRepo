<template>
    <div class="quiz-page-main">
  
      <div class="quizzes">
         <!-- conditionally displays Category Name or Custom -->
  <div  class="head">
    <div  class="custom">CUSTOM</div>
   
  </div>

  
        <h1 class="user-q">
          {{ name.toUpperCase() }}'S QUIZZES
        </h1>
        <div class="quizzes-list">
          <quiz-card
            class="quiz-list"
            v-for="(uniqueQuiz, index) in quizzes.slice().reverse()"
            :key="index"
            :quiz="uniqueQuiz"
          />
        </div>
  
        <div class="create">      
          <b-button  block variant="primary" @click="modalShow = !modalShow"
            >Create Quiz</b-button
          >

          <b-modal v-model="modalShow">
          
            <create-quiz  />
            <template #modal-footer>
  <b-button class="close" @click="hideModal">Close</b-button>
</template>
          </b-modal>
        </div>

      </div>
    </div>
  </template>
  

<script>
import quizCard from "../components/QuizCard";
import quizService from "../services/QuizService";
import createQuiz from "../components/CreateQuiz";
export default {
    components: { quizCard, createQuiz },
    data() {
    return {
      modalShow: false,
      category: null,
      categoryId: this.$route.params.categoryId,
      quiz: {},
      quizzes: [],
      name: this.$store.state.user.username,
    };
  },
  mounted(){

    try {
      const routeParams = this.$route.params;

      if ("id" in routeParams) {
        // If userId is in routeParams, use getQuizzesByUserId
        quizService.getQuizzesByUserId(routeParams.id).then((response) => {
          this.quizzes = response.data;
        });
      } else if ("categoryId" in routeParams) {
        // If categoryId is in routeParams, use getQuizzesByCategoryId
        quizService
          .getQuizzesByCategoryId(routeParams.categoryId)
          .then((response) => {
            this.quizzes = response.data;
          });
      } else {
        // Handle the case where neither userId nor categoryId is present
      }
    } catch (error) {
      console.error(error);
    }
  },

  created() {
    window.scrollTo(0, 0);
  },
  methods:{
    hideModal() {
      this.modalShow = false
      this.$bvModal.hide() 
  
    },
  }
}
</script>


<style scoped>
button.btn.close{
  padding: .5rem;
}

.create{
 
  padding-top: 2rem;
  display: flex;
  justify-content: center;
}
/* button{
  display: inline-block;
  width: 50%;
  border-radius: 20px;
} */
h1.user-q {
  text-decoration: none;
  color: black;
}
.q-quiz {
  margin-top: 14rem;
  /* color: white; */
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}
.create-form {
  flex-wrap: wrap;
  margin-left: 2rem;
}
.custom{
  font-size: 5rem;
  font-weight:bold;
  text-align: center;

}

.custom{
  padding-top: 5rem;
  align-items: flex-end;
  justify-content: center;
  display: flex;
  flex-wrap: wrap;
  z-index: -1;
  background-color: #427AA1;
  left: 0;
  right: 0;
  position: absolute;
  top:0px;
  height: 12rem;
}
h1.user-q{
  padding-top: 3rem;
}
.head{
  padding-top: 3rem;
  display: flex;
  flex-wrap: wrap;
  z-index: -1;
  background-color: #427AA1;
  left: 0;
  right: 0;
  height: 9rem;
  position: absolute;
  top:0px;
}
.cat{
  font-size: 4rem;
}
h1{
padding-top: 1.6rem;
}
.head, h1 {
  color: black;
  display: flex;
  justify-content: center;
}
.create-button {
  margin-top: 1.26rem;
 
}

.create-button,
.user-q {
  font-weight: bold;
  color: white;
  background: none;
  border: none;
  cursor: pointer;
  font-size: 2rem;
  text-decoration: underline;
}
.quizzes-list {
  flex-wrap: wrap;
  justify-content: center;
  display: flex;
  margin-top: 2rem;
  padding: 0.5rem;
  margin-left: 2rem;
  color: white;
  /* background: rgba(255, 253, 253, 0.00);
box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25); */
}
.quiz-list {
  padding: 0.6rem;
}
.quiz-page-main {
  margin-top: 8rem;
}
.quiz-page {
  color: white;
  display: flex;
  flex-wrap: wrap;
  margin-top: 2rem;
  /* margin: 5rem; */
  justify-content: center;
}

h1.name {
  color: black;
}
button:not(:disabled), [type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled) {
    width: 40%;
}
</style>