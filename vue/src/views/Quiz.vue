<template>
  <div>
    {{ quizzes }}
    <question v-for="quiz in quizzes" :key="quiz.quizId" />
  </div>
</template>

<script>
import question from '../components/QuestionList.vue'
import quizService from '../services/QuizService';
export default {
components:{question},
data(){
    return{
        quiz:{},
         quizzess:{}
    }
},
// computed: {
//     uniqueQuestions() {
//       // Use a Set to store unique quiz names
//       const uniqueQuestion = new Set();

//       // Filter out duplicate quiz names and store in an array
//       const filteredQuizzes = this.quizzes.filter((quiz) => {
//         if (!uniqueQuestion.has(quiz.question)) {
//           uniqueQuestion.add(quiz.question);
//           return true;
//         }
//         return false;
//       });

//       return filteredQuizzes;
//     }
// },
    mounted() {
    try {
      quizService.getQuizzes(this.$route.params.quizId).then((response) => {
        this.quizzes = response.data;
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