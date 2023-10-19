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


        <button @click.prevent="editAndOpen(editingQuiz)" v-if="quiz.categoryId === 6">Edit Quiz</button>
       
    <!-- Conditionally render create-quiz component -->
     

        <!-- <button
          class="update"
          @click="editQuiz(quiz)"
          v-if="quiz.categoryId === 6"
        >Edit Quiz</button> -->

      </div>
      
    </router-link>
    <create-quiz v-if="isModalOpen" @click="closeModal" @closeModal="closeModal" :quiz="editingQuiz" @save="saveQuiz"></create-quiz>
  </div>
</template>

<script>
import createQuiz from "./CreateQuiz.vue";
import quizService from "../services/QuizService";
export default {
  data(){
  return{
    editingQuiz: {
        quizName: this.quiz.quizName,
        categoryId: 6, 
        questionAnswers: this.quiz.questions    
      },
   isModalOpen: false,
  }
},
  components:{createQuiz},
  name: "quiz",
  props: {
    quiz: Object,
  },
  methods: {
    editAndOpen(quiz) {
    // Call the "editQuiz" method
    this.editQuiz(quiz);

    // Call the "openModal" method
    this.openModal();
  },
    openModal() {
      this.isModalOpen = true; // Open the modal
    },
    closeModal() {
      this.isModalOpen = false; // Close the modal
    },
    deleteQuiz(quiz) {
      const userConfirm = confirm(
        "Would you like to delete " + quiz.quizName + "?"
      );
      if (userConfirm) {
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
    editQuiz() {
      const payload = {
        quizName: this.quiz.quizName,
        categoryId: 6, 
        questionAnswers: this.quiz.questions,
    
      };
      event.preventDefault();
     console.log("this is the quiz data"+ payload)
      this.editingQuiz = true;
     
      // Set the quiz you want to edit
      this.editingQuiz =payload; // Make a copy of the quiz data
    },
    saveQuiz() {
      // Make the Axios call to update the quiz
      const quizId = this.editingQuiz.quizId; // Assuming you have a quizId
      const payload = this.editingQuiz;
console.log("reached save quiz")
      quizService
        .editQuiz(quizId, payload)
        .then((response) => {
          console.log("Quiz updated successfully", response);

          // Clear the editing state
          this.editingQuiz = null;

          // Close the modal
          this.closeModal();
        })
        .catch((error) => {
          console.error("Error updating quiz", error);
        });
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