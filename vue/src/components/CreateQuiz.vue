<template>
  <div class="modal-content">
    <form @submit="submitQuiz">
      <label for="quizName">Quiz Name:</label>
      <b-form-textarea
        placeholder="26 character maximum"
        :state="quizName.length <= 26 && quizName.length != 0"
        class="name"
        id="textarea-no-resize"
        v-model="quizName"
        required
        rows="3"
        no-resize
      ></b-form-textarea>
      <div
        class="questions"
        v-for="(question, index) in questions"
        :key="index"
      >
        <label>Question:</label>
        <b-form-textarea
          :validated="(state = true)"
          placeholder="250 character maximum"
          :state="
            questions[index].question.length <= 250 &&
            questions[index].question.length != 0
          "
          id="textarea-no-resize"
          v-model="questions[index].question"
          required
          rows="3"
          no-resize
        ></b-form-textarea>
        <label>Answer:</label>
        <b-form-textarea
          placeholder="250 character maximum"
          :state="
            questions[index].answer.length <= 250 &&
            questions[index].answer.length != 0
          "
          id="textarea-no-resize"
          v-model="questions[index].answer"
          required
          rows="3"
          no-resize
        ></b-form-textarea>
        <b-button
          class="rm"
          size="sm"
          pill
          type="button"
          @click="removeQuestion(index)"
          >Remove Question</b-button
        >
        <hr />
      </div>
      <div>
        <b-button-group class="mx-1">
          <b-button @click="addQuestion">Add Question</b-button>
          <b-button type="submit">Save</b-button>
        </b-button-group>
      </div>
    </form>
  </div>
</template>

<script>
import quizService from "../services/QuizService";
export default {
  data() {
    return {
      quizName: "",
      questions: [{ question: "", answer: "" }],
    };
  },
  methods: {
    addQuestion() {
      this.questions.push({ question: "", answer: "" });
    },
    removeQuestion(index) {
      this.questions.splice(index, 1);
    },
    submitQuiz() {
      const payload = {
        quizName: this.quizName,
        categoryId: 6,
        questionAnswers: this.questions,
      };
      quizService
        .createQuiz(this.$store.state.user.id, payload)
        .then((response) => {
          console.log("Quiz created successfully", response);
          // Close the modal
          this.closeModal();
        })
        .catch((error) => {
          // Handle any errors that occur during the Axios request
          console.error("Error Submitting Quiz", error);
        });
    },
    closeModal() {
      this.$emit("closeModal");
    },
  },
};
</script>


<style scoped>
.questions {
  margin-top: 0.4rem;
  display: flex;
  flex-wrap: wrap;
}
label {
  font-size: 1.4rem;
}
.not-modal {
  padding: 1rem;
  margin-top: 1.5rem;
  background: linear-gradient(to bottom, #4a148c, #311b92);
  border-radius: 10px;
}
.input {
  font-weight: bold;
  color: white;
  font-size: 1.2rem;
  margin-left: 1rem;
  margin-top: 0.2rem;
  background-color: transparent;
  border: 1px dashed white;
}
h2 {
  font-size: 1.5rem;
}

button {
  border: none;
  cursor: pointer;
  margin-top: 10px;
}
</style>
