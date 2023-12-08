<template>
    <div>
      <form class="not-modal" @submit="submitQuiz">
        <label for="quizName">Quiz Name:</label>
        <textarea  class="input" id="quizName" v-model="quizName" required/>

        <div class="questions" v-for="(question, index) in questions" :key="index">
          <label>Question:</label>
          <textarea class="input" v-model="questions[index].question" required/>&nbsp;&nbsp;&nbsp;&nbsp;
          <label>  Answer:</label>
          <textarea class="input" v-model="questions[index].answer" required/>         
        <button type="button" @click="removeQuestion(index)">Remove Question</button>
        </div>

      <div class="bottom-buttons">
        <button type="button" @click="addQuestion">Add Question</button>
        <button type="submit">Save</button>
      </div> 
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

.questions{
  margin-top:.4rem;
  display: flex;
  flex-wrap: wrap;
}
label{
  color: #ffffff;
  font-size:1.4rem;
}
.not-modal{
  padding:1rem;
  margin-top:1.5rem;
  background: linear-gradient(to bottom, #4a148c, #311b92);
  border-radius: 10px;
}
.input{
  font-weight:bold;
  color: white;
  font-size: 1.2rem;
  margin-left: 1rem;
  margin-top:.2rem;
  background-color: transparent;
  border: 1px dashed white;
}
h2 {
  font-size: 1.5rem;
}

button {
  font-size: 1rem;
  background-color: transparent;
  color: white;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
  margin-top: 10px;
}
</style>
