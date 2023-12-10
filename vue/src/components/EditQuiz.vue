<template>
  <div class="modal-content">
    <form @submit="submitEdit">
      <label for="quizName">Quiz Name:</label>
      <b-form-textarea placeholder="26 character maximum" :state="quizName.length <= 26 && quizName.length != 0" class="name" id="textarea-no-resize" v-model="quizName" required rows="3" no-resize></b-form-textarea>
      <div class="questions" v-for="(question, index) in questions" :key="index">       
        <label>Question:</label>
        <b-form-textarea :validated="state=true" placeholder="250 character maximum" :state="questions[index].question.length <= 250 && questions[index].question.length != 0" id="textarea-no-resize" v-model="questions[index].question" required  rows="3" no-resize></b-form-textarea>
        <label>Answer:</label>
        <b-form-textarea placeholder="250 character maximum" :state="questions[index].answer.length <= 250 && questions[index].answer.length != 0" id="textarea-no-resize" v-model="questions[index].answer" required  rows="3" no-resize></b-form-textarea>
        <b-button class="rm" size="sm" pill type="button" @click="removeQuestion(index)">Remove Question</b-button>
<hr>

      </div>
      <div>
        <b-button-group class="mx-1">
      <b-button  @click="addQuestion">Add Question</b-button>
      <b-button  type="submit">Save</b-button>
      <b-button   @click="deleteQuiz(quiz)">Delete</b-button>
     
    </b-button-group>
   
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
      textValue:'',
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
    
  //   checkInput(event){
  //  if (this.questions[0].question.length > 300){
  //   // console.log(this.questions[0].answer)
  //   event.preventDefault();
  //    alert("Invalid form input")
  //  }
  //   },
        checkChars(event){
   if (this.quizName.length > 26){
    event.preventDefault();
     alert("Invalid form input")
   }
    },
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
      // this.checkInput(event);
      this.checkChars(event);
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
    }
  }
};
</script>

  <style scoped>

  /* trying to select specific button to modify/size color with bootstrap vue
/* button.rm:not(:disabled), [type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled) > .rm{
    cursor: pointer;
    background-color: red;
    font-size: .8rem;
} */
  label{
    margin-bottom: .6rem;
  }
  #textarea-no-resize{
    margin-bottom:.3rem;
  }
  /* button{
    content:"";
    font-size: 1rem;
  background-color: transparent;
  color: white;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
  margin-top: 10px;
  } */
.modal-content{

}
.questions, .name{
  margin-top: 0.2rem;
}


/* .input {
  font-size:1rem;
  font-weight: bold;
  color:white;
  background-color: transparent;
  border: 1px dashed white;
  margin-left: 1rem;
  margin-top: 0.2rem;
} */


</style>