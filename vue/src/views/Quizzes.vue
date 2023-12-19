<template>
  <div class="quiz-page-main">
    <div class="quizzes">
      <div class="head">
        <h1 class="cat">{{ category }}</h1>
      </div>
      <div class="q-quiz">
        <quiz-card
          class="quiz-list"
          v-for="(uniqueQuiz, index) in quizzes.slice().reverse()"
          :key="index"
          :quiz="uniqueQuiz"
        />
      </div>
    </div>
  </div>
</template>

<script>
import quizCard from "../components/QuizCard";
import quizService from "../services/QuizService";
import CategoryService from "../services/CategoryService";
export default {
  components: { quizCard },
  data() {
    return {
      modalShow: false,
      category: null,
      categoryId: this.$route.params.categoryId,
      quiz: {},
      quizzes: [],
      name: this.$store.state.user.username,
    };
  },
  computed: {
    uniqueQuizzes() {
      // Use a Set to store unique quiz names
      const uniqueNames = new Set();
      // Filter out duplicate quiz names and store in an array
      const filteredQuizzes = this.quizzes.filter((quiz) => {
        if (!uniqueNames.has(quiz.quizName)) {
          uniqueNames.add(quiz.quizName);
          return true;
        }
        return false;
      });
      return filteredQuizzes;
    },
    routeParamsCheck() {
      return "id" in this.$route.params;
    },
  },
  mounted() {
    CategoryService.getCategories().then((response) => {
      const categoryData = response.data[this.$route.params.categoryId - 1];
      if (categoryData && categoryData.categoryName) {
        this.category = categoryData.categoryName.toUpperCase();
      } else {
        // Handle the case where categoryData or categoryName is undefined
        return;
      }
    });
    try {
      const routeParams = this.$route.params;
      if ("id" in routeParams) {
        // If userId is in routeParams, use getQuizzesByUserId
        quizService.getQuizzesByUserId(routeParams.id).then((response) => {
          this.quizzes = response.data;
        });
      } else if ("categoryId" in routeParams) {
        // If categoryId is in routeParams, use getQuizzesByCategoryId
        quizService
          .getQuizzesByCategoryId(routeParams.categoryId)
          .then((response) => {
            this.quizzes = response.data;
          });
      } else {
        // Handle the case where neither userId nor categoryId is present
      }
    } catch (error) {
      error;
    }
  },
  created() {
    window.scrollTo(0, 0);
  },
};
</script>

<style scoped>
@media screen and (min-width: 200px) {
  .create {
    padding-top: 2rem;
    display: flex;
    justify-content: center;
  }
  button {
    display: inline-block;
    width: 50%;
    border-radius: 20px;
  }
  h1.user-q {
    text-decoration: none;
    color: black;
  }
  .q-quiz {
    padding-right: 10rem;
    padding-left: 10rem;
    margin-top: 10rem;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
  }
  .create-form {
    flex-wrap: wrap;
    margin-left: 2rem;
  }
  .custom {
    font-size: 5rem;
    font-weight: bold;
    text-align: center;
  }
  h1.user-q {
    padding-top: 3rem;
  }
  .head {
    padding-top: 3rem;
    display: flex;
    flex-wrap: wrap;
    z-index: -1;
    left: 0;
    right: 0;
    height: 9rem;
    position: absolute;
    top: 0px;
  }
  .cat {
    margin-top: 2rem;
    font-size: 2rem;
  }
  h1 {
    padding-top: 1.6rem;
  }
  .head,
  h1 {
    color: black;
    display: flex;
    justify-content: center;
  }
  .create-button {
    margin-top: 1.26rem;
  }

  .create-button,
  .user-q {
    font-weight: bold;
    color: white;
    background: none;
    border: none;
    cursor: pointer;
    font-size: 2rem;
    text-decoration: underline;
  }
  .quizzes-list {
    flex-wrap: wrap;
    justify-content: center;
    display: flex;
    margin-top: 2rem;
    padding: 0.5rem;
    margin-left: 2rem;
    color: white;
  }
  .quiz-list {
    padding: 0.6rem;
  }
  .quiz-page-main {
    margin-top: 8rem;
  }
}
@media screen and (min-width: 500px) {
  .cat {
    margin-top: 0.7rem;
    font-size: 4rem;
  }
}
</style>