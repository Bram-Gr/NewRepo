<template>
    <div
      class="quiz-card"
      @click="toggleAnswer"
      :class="{ 'show-answer': isAnswerVisible }"
    >
      <div class="question">{{ question.question }}</div>
      <div class="answer">{{ question.answer }}</div>
    </div>
  </template>
  
  <script>
  export default {
    props: {
      question: Object // Assuming your question is an object with a "question" and "answer" property
    },
    data() {
      return {
        isAnswerVisible: false
      };
    },
    methods: {
      toggleAnswer() {
        this.isAnswerVisible = !this.isAnswerVisible;
      }
    }
  };
  </script>
  
  <style scoped>
  .quiz-card {
    width: 200px;
    padding: 16px;
    background-color: beige;
    border: 1px solid #ccc;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
    cursor: pointer;
    transition: box-shadow 0.3s ease;
    margin: 16px;
  }
  
  .quiz-card:hover {
    box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.4);
  }
  
  .question {
    font-weight: bold;
    margin-bottom: 8px;
  }
  
  .answer {
    display: none;
    background-color: white;
    padding: 8px;
    border: 1px solid #ccc;
    margin-top: 8px;
  }
  
  .show-answer .answer {
    display: block;
  }
  </style>
  