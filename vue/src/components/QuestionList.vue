<template>
  <div
    class="quiz-card"
    @click="toggleAnswer"
    :class="{ 'show-answer': isAnswerVisible }"
  >
    <div v-if="!isAnswerVisible" class="question">{{ question.question }}</div>
    <div v-else class="answer">{{ question.answer }}</div>
  </div>
</template>
  
  <script>
export default {
  props: {
    question: Object,
  },
  data() {
    return {
      isAnswerVisible: false,
    };
  },
  methods: {
    toggleAnswer() {
      this.isAnswerVisible = !this.isAnswerVisible;
    },
  },
};
</script>
  
  <style scoped>
.quiz-card {
  color: black;
  width: 25rem;
  height: 12rem;
  padding: 16px;
  background-color: beige;
  border: 1px solid #ccc;
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
  cursor: pointer;
  transition: box-shadow 0.3s ease;
  margin: 16px;
  overflow: hidden;
}
.quiz-card:hover {
  box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.4);
}
.question {
  min-height: 6rem;
  font-weight: bold;
}
.answer {
  font-weight: bold;
  min-height: 6rem;
}
.show-answer .answer {
  display: flex;
}
</style>
  