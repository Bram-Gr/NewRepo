<template>
  <div>
    <h1>Select Quiz</h1>
    <quiz-list v-for="(uniqueQuiz, index) in uniqueQuizzes" :key="index" :quiz="uniqueQuiz" />
  </div>
</template>

<script>
import quizList from "../components/QuizList.vue";
import quizService from "../services/QuizService";

export default {
  components: { quizList },
  data() {
    return {
      quiz: {},
      quizzes: []
    };
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
  },
  mounted() {
    try {
      quizService.getQuizzesByCategoryId(this.$route.params.categoryId).then((response) => {
        this.quizzes = response.data;
        console.log(response.data);
      });
    } catch (error) {
      console.error(error);
    }
  },
};
</script>

<style>
</style>