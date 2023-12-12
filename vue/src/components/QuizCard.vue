<template>
  <div>
    <div
      class="QuizTitleCard1"
      @click="redirectToQuiz"
      v-if="quiz.categoryId === 6"
    >
      <router-link
        class="link"
        :to="{ name: 'Quiz', params: { quizId: quiz.quizId } }"
      >
        <b-button
          block
          variant="primary"
          @click="editQuiz(existingQuizData), (modalShow = !modalShow)"
          >Edit</b-button
        >

        <h1 class="name">{{ quiz.quizName }}</h1>

        <b-modal v-model="modalShow" title="Edit Quiz">
          <edit-quiz
            :quizData="this.quizData"
            :quiz="this.quiz"
            :submitFunction="submitEdit"
          />
          <template #modal-footer>
            <b-button class="close" @click="hideModal">Close</b-button>
          </template>
        </b-modal>
      </router-link>
    </div>

    <div class="QuizTitleCard2" @click="redirectToQuiz" v-else>
      <router-link
        class="link"
        :to="{ name: 'Quiz', params: { quizId: quiz.quizId } }"
      >
        <h1 class="name">{{ quiz.quizName }}</h1>
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
      quizData: this.quizData,
      modalShow: false,
      existingQuizData: {
        ...this.quiz,
        questionAnswers: [],
      },
      editButton: true,
    };
  },
  components: { EditQuiz },
  props: {
    quiz: Object,
  },
  methods: {
    hideModal() {
      this.modalShow = false;
      this.$bvModal.hide();
    },
    redirectToQuiz() {
      // Access the route information from the router-link and navigate programmatically
      this.$router.push({
        name: "Quiz",
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
      event.stopPropagation();
      this.isModalOpen = true;
      this.editButton = false;
      event.preventDefault();
      // Set the quiz you want to edit
      this.editingQuiz = JSON.parse(JSON.stringify(quiz));
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
        this.questionAnswers = this.quizData;
      })
      .catch((error) => {
        console.error("Error fetching quiz data:", error);
      });
  },
};
</script>

<style scoped>
button.btn.close {
  padding: 0.5rem;
}
button:not(:disabled),
[type="button"]:not(:disabled),
[type="reset"]:not(:disabled),
[type="submit"]:not(:disabled) {
  cursor: pointer;
  margin: 0.6rem;
  padding: 0.3rem;
  padding-bottom: 0rem;
}
.QuizTitleCard1,
.QuizTitleCard2 {
  border: 1px solid #679436;
  cursor: pointer;
  background: #ebf2fa;
  border-radius: 10px;
  min-width: 15rem;
  max-width: 15rem;
  min-height: 13rem;
  max-height: 1rem;
  overflow: hidden;
}
.QuizTitleCard2 {
  display: flex;
  justify-content: center;
  align-items: center;
}
.name {
  color: #064789;
  text-align: center;
}
.link {
  text-decoration: none;
}
</style>