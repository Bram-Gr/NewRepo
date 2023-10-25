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

        <button @click="editQuiz(existingQuizData)"   v-if="quiz.categoryId === 6">Edit Quiz</button>
    

     
      

      </div>

    </router-link>
    <edit-quiz v-if="isModalOpen" :quiz="editingQuiz" :submitFunction="submitEdit" @closeModal="closeModal"  />
  </div>
</template>

<script>
import EditQuiz from "./EditQuiz.vue";
import quizService from "../services/QuizService";
export default {
  data(){
  return{
   existingQuizData: this.quiz,
   isModalOpen:false
  }
},
  components:{EditQuiz},
  props: {
    quiz: Object,
  },
  methods: {
    openModal() {
      this.isModalOpen = true; // Open the modal
    },
    closeModal() {
      this.isModalOpen = false;
    },
    submitEdit(formData) {
      
      quizService.editQuiz(formData).then((response)=>{
        console.log("edit quiz successful"+response);
        this.closeModal();
        window.location.reload();
      }).catch((error) => {
      // Handle any errors that occur during the Axios request
      console.error('Error editing Quiz', formData, error);
    });
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
    editQuiz(quiz) {
      this.isModalOpen = true;
      event.preventDefault();
 
     
      // Set the quiz you want to edit
      this.editingQuiz = JSON.parse(JSON.stringify(quiz));
// Make a copy of the quiz data
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