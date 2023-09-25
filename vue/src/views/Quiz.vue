<template>
  <div>
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
       questions:[]
    }
},
    mounted() {
    try {
      quizService.getQuestionsByQuizId(this.$route.params.quizId).then((response) => {
        this.questions = response.data;
        console.log(response.data);
      });
    } catch (error) {
      console.error(error);
    }
  },
}
</script>

<style>

</style>