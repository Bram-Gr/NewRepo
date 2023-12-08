<template>
  <!-- should be called QuizCard.vue, note for refactor -->
  <div>
  <div class="QuizTitleCard1"  v-if="quiz.categoryId === 6">

    <router-link
      class="link"
      :to="{ name: 'Quiz', params: { quizId: quiz.quizId } }"
    >
    <b-button  block variant="primary" @click="editQuiz(existingQuizData),   modalShow = !modalShow">Edit</b-button>
      <!-- <div class="quiz-box"> -->
        <h1 class="name">{{ quiz.quizName }}</h1>

        

<b-modal v-model="modalShow">
  <edit-quiz
      :quizData="this.quizData"
      :quiz="this.quiz"
      :submitFunction="submitEdit"/>
</b-modal>



    </router-link>

<!-- 
    <edit-quiz
      v-if="isModalOpen"
      :quizData="this.quizData"
      :quiz="this.quiz"
      :submitFunction="submitEdit"
      @closeModal="closeModal"
    /> -->




  </div>







  <div class="QuizTitleCard2"  @click="redirectToQuiz"  v-else>
    <router-link
      class="link"
      :to="{ name: 'Quiz', params: { quizId: quiz.quizId } }"
    >
      <!-- <div class="quiz-box"> -->
        <h1 class="name">{{ quiz.quizName }}</h1>
     
      <!-- </div> -->
    </router-link>
  </div>
</div>
</template>

<script>
import EditQuiz from "./EditQuiz.vue";
import quizService from "../services/QuizService";
export default {
  data() {
    return {
      modalShow: false,
      sampleQuiz: {
        quizName: "Sample Quiz",
        questionAnswers: [
          { question: "Sample Question 1", answer: "Sample Answer 1" },
          { question: "Sample Question 2", answer: "Sample Answer 2" },
        ],
      },
      existingQuizData: {
        ...this.quiz,
        questionAnswers: [],
      },
      isModalOpen: false,
      editButton: true,
    };
  },
  components: { EditQuiz },
  props: {
    quiz: Object,
  },
  methods: {
    redirectToQuiz() {
      // Access the route information from the router-link and navigate programmatically
      this.$router.push({
        name: 'Quiz',
        params: { quizId: this.quiz.quizId },
      });
    },
    openModal() {
      this.isModalOpen = true; // Open the modal
    },
    closeModal() {
      this.isModalOpen = false;
      this.editButton = true;
    },
    submitEdit(formData) {
      this.questionAnswers = this.quizData;
      quizService
        .editQuiz(formData)
        .then((response) => {
          console.log("edit quiz successful" + response);
          this.closeModal();
          // window.location.reload();
        })
        .catch((error) => {
          // Handle any errors that occur during the Axios request
          console.error("Error editing Quiz", formData, error, this.quizData);
        });
    },

    editQuiz(quiz) {
      this.isModalOpen = true;
      this.editButton = false;
      event.preventDefault();

      // Set the quiz you want to edit
      this.editingQuiz = JSON.parse(JSON.stringify(quiz));

      console.log("Original quiz object:", quiz);
      console.log("Original quiz questions:", this.quizData);
      console.log("Copied editingQuiz object:", this.existingQuizData);
      // Make a copy of the quiz data

      this.formData = {
        quiz: this.quiz,
        questionAnswers: this.quizData, // Assuming questionAnswers is an array in your quiz
      };
    },
  },
  created() {
    // Fetch the quiz data using Axios
    quizService
      .getQuestionsByQuizId(this.quiz.quizId) // Replace with the actual API endpoint
      .then((response) => {
        this.quizData = response.data; // Set the fetched quiz data
        console.log(this.quizData);
        this.questionAnswers = this.quizData;
      })
      .catch((error) => {
        console.error("Error fetching quiz data:", error);
      });
  },
};
</script>

<style scoped>

button:not(:disabled), [type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled) {
    cursor: pointer;
    margin: .6rem;
    /* top:580px;
    position: absolute; */
    padding: .3rem;
    padding-bottom: 0rem;
}
/* .edit-button{
  display: flex;
  justify-content: flex-end;
  align-items: flex-end;

} */
.QuizTitleCard1, .QuizTitleCard2{
  border: 1px solid #679436;
  /* color: #064789; */
  cursor: point;
  background:#EBF2FA;
  border-radius: 10px;
  min-width: 15rem;
  max-width: 15rem;
  min-height: 13rem;
  max-height: 1rem;
}
.QuizTitleCard2{
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
}
.edit {
 
  position:relative;

  top: 16px;
  font-size: .8rem;
  background-color: transparent;
  color: white;
  border: none;
  padding: 20px 20px;
  cursor: pointer;
  margin-top: 10px;
}
.name {
  color: #064789;
  text-align: center;
  /* margin-top: 1.4rem; */
 
}
.link {
  text-decoration: none;
}
</style>