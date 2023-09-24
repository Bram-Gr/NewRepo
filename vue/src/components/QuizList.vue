<template>
  <div class="QuizTitleCard">
    <router-link
      :to="{ name: 'Quiz', params: { quizId: quiz.quizId } }"
    >
      <h1>{{ quiz.quizName }}</h1>
    </router-link>
  </div>
</template>

<script>
export default {
    name: 'quiz',
    props:{
        quiz:Object
    }
}
</script>

<style>

</style>