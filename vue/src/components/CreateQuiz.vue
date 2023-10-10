<template>
  <modal name="create-quiz-modal" class="modal">
    <!-- Modal content goes here -->
    <div class="modal-content">
      <h2>Create Quiz</h2>
      <form @submit.prevent="submitQuiz">
        <label for="quizName">Quiz Name:</label>
        <input type="text" id="quizName" v-model="quizName" required>

        <div v-for="(question, index) in questions" :key="index">
          <label>Question {{ index + 1 }}:</label>
          <input type="text" v-model="questions[index].question" required>
          <label>Answer {{ index + 1 }}:</label>
          <input type="text" v-model="questions[index].answer" required>
        </div>

        <button type="button" @click="addQuestion">Add Question</button>

        <button type="submit">Create</button>
        <button @click="closeModal">Close</button>
      </form>
    </div>
  </modal>
</template>

<script>
export default {
  data() {
    return {
      quizName: '',
      questions: [{ question: '', answer: '' }],
    };
  },
  methods: {
    addQuestion() {
      this.questions.push({ question: '', answer: '' });
    },
    submitQuiz() {
      const payload = {
        quizName: this.quizName,
        categoryId: 6, // Set your category ID here
        questionAnswers: this.questions,
        userId: this.userId, // You need to set the user ID here
      };
      // Make your Axios POST request to create the quiz with the payload
      this.$store.dispatch('createQuiz', payload);
      // Close the modal
      this.$modal.hide('create-quiz-modal');
    },
    closeModal() {
      this.$modal.hide('create-quiz-modal');
    },
  },
};
</script>


<style scoped>
/* Add your modal styles here */
.modal {
  
}

h2 {
  font-size: 1.5rem;
}

button {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
  margin-top: 10px;
}
</style>
