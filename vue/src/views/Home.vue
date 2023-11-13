<template>
  <div class="home">
    <div class="title" v-if="user.username">Welcome To Quizzical, {{ user.username.toUpperCase() }}!
      <p> Browse Categories to Select a Quiz or Create your Own Custom Quiz 
        Browse categories or create and account to make your own note card quizzes!
       <br><br> Road map
<ul>
<li>Implement AI to generate multiple choices answers with varying degrees of difficulty.</li>
     <li>Community quizzes will allow users to submit their quizzes for review, if approved users will be able to interact with these quizzes and rate them.</li>
<li>Currently working on game logic to bolster user engagement.</li>
</ul>
      </p>
    </div>
    <div class="title" v-else>Welcome To Quizzical!
      <p>Browse Categories to Select a Quiz or Create a Custom Quiz (requires login)
        Browse categories or create and account to make your own note card quizzes!

        <br><br>Road map
<ul>
<li>Implement AI to generate multiple choices answers with varying degrees of difficulty.</li>
<li>Community quizzes will allow users to submit their quizzes for review, if approved users will be able to interact with these quizzes and rate them.</li>
<li>Currently working on game logic to bolster user engagement.</li>
</ul>
      </p>
      </div> 
   
<div class="categories">
    <router-link class="link"
  :to="getQuizListRoute(category.categoryId, user.id)"
  v-for="category in categories"
  :key="category.categoryId"
>
  <!-- <category v-if="category.categoryId === 6" @show-alert="showAlert" :category="category" />
  <category v-else :category="category" /> -->
  <category :category="category" />

</router-link>
</div>

  </div>
</template>

<script>
import { mapState } from "vuex";
import CategoryService from "../services/CategoryService";
import Category from "../components/Category";

export default {
  components: { Category },
  name: "home",
  data() {
    return {
      category: "",
      categories: [],
      user: this.$store.state.user || {},
      username: this.$store.state.user.username || "",
    };
  },
  methods: {
    // showAlert(){
    //   console.log("reached show alert")
    //   if (confirm(" requires login")){
    //     return ''
    //   }else{
    //       this.$router.push('/logout')
    //   }
    // },
    getQuizListRoute(categoryId, id) {
      if (categoryId === 6) {
        // If categoryId is 6, navigate to "userQuizList" with user.userId
        return { name: "userQuizList", params: { id } };
      } else {
        // Otherwise, navigate to "quizList" with categoryId
        return { name: "quizList", params: { categoryId } };
      }
    },
  },
  computed: {
    ...mapState("user", ["Id"]),
    caseUsername() {
      return this.username.toUpperCase();
    },
  },
  created() {
    CategoryService.getCategories().then((response) => {
      this.categories = response.data;
    });
    this.user.id = this.$store.state.user.id || "";
  },
};
</script>

<style scoped>

.title {
  font-size: 3rem;
}
h1,
p {
  font-size: 1.5rem;
}
.home {
  padding: 4rem;
  margin: 2rem;
  color: white;
}
.categories{
  margin-top:3rem;
}
.link {
  text-decoration: none;
  text-transform: uppercase;
}
</style>
