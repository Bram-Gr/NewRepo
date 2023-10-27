<template>

    <!-- Modal content goes here -->
    <div class="modal-content">
      <form @submit="submitQuiz">
        <label for="quizName">Quiz Name:</label>
        <textarea  class="input" id="quizName" v-model="quizName" required/>

        <div v-for="(question, index) in questions" :key="index">
          <label>Question {{ index + 1 }}:</label>
          <textarea class="input" v-model="questions[index].question" required/>
          <label>  Answer {{ index + 1 }}:</label>
          <textarea class="input" v-model="questions[index].answer" required/>
          <button type="button" @click="addQuestion">Add Question</button>
        <button type="button" @click="removeQuestion(index)">Remove Question</button>
        </div>

      
        <button type="submit">Save</button>
        <button @click="closeModal">Close</button>
      </form>
    </div>

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
    removeQuestion(index) {
      this.questions.splice(index,1);
    },
    submitQuiz() {
      const payload = {
        quizName: this.quizName,
        categoryId: 6, 
        questionAnswers: this.questions,
    
      };
    
 
  quizService.createQuiz(this.$store.state.user.id, payload)
    .then((response) => {
      
      console.log('Quiz created successfully', response);

      // Close the modal
      this.closeModal();
    })
    .catch((error) => {
      // Handle any errors that occur during the Axios request
      console.error('Error Submitting Quiz', error);
    });
},

    closeModal() {
      console.log("closing modal")
      this.$emit('closeModal');
    },

  },
};
</script>


<style scoped>

.modal {
  
}
.input{
  margin-left: 1rem;
  margin-top:.2rem;
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
