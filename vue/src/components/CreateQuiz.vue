<template>
  <modal name="create-quiz-modal" class="modal">
    <!-- Modal content goes here -->
    <div class="modal-content">
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
import quizService from '../services/QuizService';
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
        categoryId: 6, 
        questionAnswers: this.questions,
    
      };
    
 
  quizService.createQuiz(this.$storeid, payload)
    .then((response) => {
      
      console.log('Quiz created successfully', response);

      // Close the modal
      this.$modal.hide('create-quiz-modal');
    })
    .catch((error) => {
      // Handle any errors that occur during the Axios request
      console.error('Error creating quiz', error);
    });
},

    closeModal() {
      this.$emit.hide('create-quiz-modal');
    },
  },
};
</script>


<style scoped>

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
