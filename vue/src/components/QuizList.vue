<template>
  <div class="QuizTitleCard">
    <router-link :to="{ name: 'Quiz', params: { quizId: quiz.quizId } }">
      <div class="quiz-box">
        <h1>{{ quiz.quizName }}</h1>

        <button
          class="delete"
          @click="deleteQuiz(quiz)"
          v-if="quiz.categoryId === 6"
        ></button>
      </div>
    </router-link>
  </div>
</template>

<script>
import quizService from "../services/QuizService";
export default {
  name: "quiz",
  props: {
    quiz: Object,
  },
  methods: {
    deleteQuiz(quiz) {
      const userConfirm = confirm(
        "Would you like to delete " + quiz.quizName + "?"
      );
      if (userConfirm) {
        event.preventDefault();
        window.location.reload();
        quizService
          .deleteQuiz(quiz.quizId)

          .then((response) => {
            console.log("Quiz created successfully", response);
          })
          .catch((error) => {
            console.error("Error Submitting Quiz", error);
          });
      } else {
        event.preventDefault();
      }
    },
  },
};
</script>

<style>
.quiz-box {
  display: flex;
  border: 1px solid black;
  margin-bottom: 1rem;
}
/* Style for the red box */
.delete {
  display: flex;
  align-self: center;
  height: 1rem;
  margin-left: 3rem;
  background-color: red;
  color: white;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
  position: relative;
  border-radius: 5px;
}

/* Style for the white "x" inside the red box */
.delete::before {
  content: "✕"; /* Unicode for the "x" character */
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 20px;
  line-height: 0;
}
</style>