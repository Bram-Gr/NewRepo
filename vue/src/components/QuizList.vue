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

        <button @click.prevent="editQuiz(existingQuizData)"   v-if="quiz.categoryId === 6">Edit Quiz</button>
    

     
       

        <!-- <button
          class="update"
          @click="editQuiz(quiz)"
          v-if="quiz.categoryId === 6"
        >Edit Quiz</button> -->

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
    editingQuiz: false, // Initialize with no quiz to edit
   existingQuizData: this.quiz,
   isModalOpen:false
  }
},
  components:{EditQuiz},
  name: "quiz",
  props: {
    quiz: Object,
  },
  methods: {
    openModal() {
      this.isModalOpen = true; // Open the modal
    },
    closeModal() {
      // Close the modal
    },
    submitEdit(formData) {
      // Handle the submission logic for editing the quiz
      console.log('Data to update:', formData);
      // Call the appropriate service method to update the quiz
      // Then close the modal or perform other actions as needed
      this.closeModal();
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
      this.editingQuiz = true;
     
      // Set the quiz you want to edit
      this.editingQuiz = { ...quiz }; // Make a copy of the quiz data
    },
    saveQuiz() {
      event.preventDefault();
      // Handle saving the updated quiz (Axios call, etc.)
      // Then clear the editing state
      this.editingQuiz = null;
      window.location.reload();
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