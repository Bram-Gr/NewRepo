<template>
  <div class="quiz">
<h1 class="name">{{ quizName }}</h1>

    <question v-for="(question, index) in questions" :key="index" :question="question"/>
  </div>
</template>

<script>
import question from '../components/QuestionList.vue'
import quizService from '../services/QuizService';
export default {
components:{question},
data(){
    return{
       questions:[],
       quizName: this.quizName
    }
},
    mounted() {
      try {
      quizService.getQuizzesByQuizId(this.$route.params.quizId).then((response) => {
         this.quizName = response.data[0].quizName
      });
    } catch (error) {
      console.error(error);
    }
    try {
      quizService.getQuestionsByQuizId(this.$route.params.quizId).then((response) => {
        this.questions = response.data;
        console.log(response.data);
      });
    } catch (error) {
      console.error(error);
    }
  },
  created(){
    window.scrollTo(0, 0);
  }
}
</script>

<style>
.name{
  display: flex;
  justify-content: center;
}
.quiz{
  height:100vh;
  margin:4rem;
}
</style>