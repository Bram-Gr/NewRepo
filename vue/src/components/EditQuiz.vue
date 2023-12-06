<template>
  <div class="modal-content">
    <form @submit="submitEdit">
      <label for="quizName">Quiz Name:</label>
      <textarea class="input" id="quizName" v-model="quizName" required />

      <div class="questions" v-for="(question, index) in questions" :key="index">
        <label>Question:</label>
        <textarea id="questionAnswers" class="input" v-model="questions[index].question" required />&nbsp;&nbsp;&nbsp;
        <label>Answer:</label>
        <textarea id="questionAnswers" class="input" v-model="questions[index].answer" required />

        <button type="button" @click="removeQuestion(index)">Remove Question</button>
      </div>
<div class="bottom-buttons">
  <button
          @click="deleteQuiz(quiz)"
        >Delete</button>

  <button  @click="addQuestion">Add Question</button>
      <button type="submit">Save</button>
      <button @click="closeModal">Close</button>
</div>
    </form>
  </div>
</template>

<script>
import quizService from "../services/QuizService";
export default {
  props: {
    quizData: Array,
    quiz: Object, // Pass the quiz data to prepopulate the form
    submitFunction: Function, // The callback function for saving edits
  },
  data() {
    return {
      quizName: '',
      questions: this.quizData
    };
  },
  created() {
    // Check if the quiz prop is defined and set data accordingly
    if (this.quiz) {
      this.quizName = this.quiz.quizName;
      this.questions = this.quizData;
    }
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
    submitEdit() {
      const payload = {
        quizId: this.quiz.quizId, // Assuming you have a quizId
        quizName: this.quizName,
        categoryId: 6,
        questionAnswers: this.questions,
      };

      if (typeof this.submitFunction === 'function') {
        this.submitFunction(payload); // Pass the data to the parent
      }
    },
    addQuestion() {
      this.questions.push({ question: '', answer: '' });
    },
    removeQuestion(index) {
      this.questions.splice(index, 1);
    },
    closeModal() {
      this.$emit('closeModal');
    },
  },
};
</script>

  <style scoped>
  button{
    content:"";
    font-size: 1rem;
  background-color: transparent;
  color: white;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
  margin-top: 10px;
  }
.modal-content{
  color:white;
  margin-left:1rem;
}
.input {
  font-size:1rem;
  font-weight: bold;
  color:white;
  background-color: transparent;
  border: 1px dashed white;
  margin-left: 1rem;
  margin-top: 0.2rem;
}


</style>