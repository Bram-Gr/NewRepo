<template>
  <div class="QuizTitleCard">
    <router-link class="link" :to="{ name: 'Quiz', params: { quizId: quiz.quizId } }">
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
    <edit-quiz v-if="isModalOpen" :quizData="this.quizData" :quiz="this.quiz" :submitFunction="submitEdit" @closeModal="closeModal"  />
  </div>
</template>

<script>
import EditQuiz from "./EditQuiz.vue";
import quizService from "../services/QuizService";
export default {
  data(){
  return{
    sampleQuiz: {
      quizName: 'Sample Quiz',
      questionAnswers: [
        { question: 'Sample Question 1', answer: 'Sample Answer 1' },
        { question: 'Sample Question 2', answer: 'Sample Answer 2' },
      ],
    },
    existingQuizData: {
      ...this.quiz,
      questionAnswers:[]
    },
   isModalOpen:false,
  }
},
  components:{EditQuiz},
  props: {
    quiz: Object
  },
  methods: {
    openModal() {
      this.isModalOpen = true; // Open the modal
    },
    closeModal() {
      this.isModalOpen = false;
    },
    submitEdit(formData) {
      this.questionAnswers = this.quizData;
      quizService.editQuiz(formData).then((response)=>{
        console.log("edit quiz successful"+response);
        this.closeModal();
        // window.location.reload();
      }).catch((error) => {
      // Handle any errors that occur during the Axios request
      console.error('Error editing Quiz', formData, error, this.quizData);
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
      
      console.log('Original quiz object:', quiz);
      console.log('Original quiz questions:', this.quizData);
      console.log('Copied editingQuiz object:', this.existingQuizData);
// Make a copy of the quiz data


      this.formData = {
        quiz: this.quiz,
        questionAnswers: this.quizData, // Assuming questionAnswers is an array in your quiz
      };
    

    },
  }, 
  created() {
  
    // Fetch the quiz data using Axios
    quizService.getQuestionsByQuizId(this.quiz.quizId) // Replace with the actual API endpoint
      .then((response) => {
        this.quizData = response.data; // Set the fetched quiz data
        console.log(this.quizData)
        this.questionAnswers = this.quizData;
      })
      .catch((error) => {
        console.error('Error fetching quiz data:', error);
      });
  },
};
</script>

<style>
.link{
  text-decoration: none;
}
.quiz-box {
  display: flex;
  margin-top:4rem;
  /* border: 1px solid black; */
  margin-bottom: 1rem;
  text-decoration: none;
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