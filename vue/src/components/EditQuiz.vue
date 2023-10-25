<template>
    <div class="modal-content">
      <form @submit="submitEdit">
        <label for="quizName">Quiz Name:</label>
        <textarea class="input" id="quizName" v-model="quizName" required />
  
        <div v-for="(question, index) in questions" :key="index">
          <label>Question {{ index + 1 }}:</label>
          <textarea class="input" v-model="questions[index].question" required/>
          <label>Answer {{ index + 1 }}:</label>
          <textarea class="input" v-model="questions[index].answer" required />
          <button type="button" @click="addQuestion">Add Question</button>
          <button type="button" @click="removeQuestion(index)">Remove Question</button>
        </div>
  
        <button type="submit">Save</button>
        <button @click="closeModal">Close</button>
      </form>
    </div>
  </template>
  
  <script>
 
  
  export default{
    props: {
      quiz: Object, // Pass the quiz data to prepopulate the form
      submitFunction: Function, // The callback function for saving edits
    },
    data() {
      return {
        quizName: this.quiz.quizName, // Prepopulate the form fields
        questions: this.quiz.questionAnswers || [],
      };
    },
    methods: {
      submitEdit() {
        const payload = {
          quizId: this.quiz.quizId,
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
      },
    },
  };
  </script>
  <style>

.input {
  margin-left: 1rem;
  margin-top: 0.2rem;
}
</style>