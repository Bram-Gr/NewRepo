<template>
  <div class="home">
    <div class="title">

      <h1 class="Quizzical">Category Select</h1>
    </div>
    <!-- <div class="title" v-if="user.username">Welcome To Quizzical, {{ user.username.toUpperCase() }}!
      <p> Browse Categories to Select a Quiz or Create your Own Custom Quiz 
        Browse categories or create and account to make your own note card quizzes!
       <br><br> Road map
<ul>
<li>Implement AI to generate multiple choices answers with varying degrees of difficulty.</li>
     <li>Community quizzes will allow users to submit their quizzes for review, if approved users will be able to interact with these quizzes and rate them.</li>
<li>Currently working on game logic to bolster user engagement.</li>
</ul>
      </p>
    </div> -->
    <!-- <div class="title" v-else>Welcome To Quizzical!
      <p>Browse Categories to Select a Quiz or Create a Custom Quiz (requires login)
        Browse categories or create and account to make your own note card quizzes!

        <br><br>Road map
<ul>
<li>Implement AI to generate multiple choices answers with varying degrees of difficulty.</li>
<li>Community quizzes will allow users to submit their quizzes for review, if approved users will be able to interact with these quizzes and rate them.</li>
<li>Currently working on game logic to bolster user engagement.</li>
</ul>
      </p>
      </div>  -->
   
<div class="categories">
    <router-link class="link"
  :to="getQuizListRoute(category.categoryId, user.id)"
  v-for="category in categories.slice().reverse()"
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
  mounted() {
   
    window.scrollTo(0, 0);
  
    CategoryService.getCategories().then((response) => {
      this.categories = response.data;
    });
    this.user.id = this.$store.state.user.id || "";
  },
};
</script>

<style scoped>
@media screen and (min-width: 150px){
  p{
    position: relative;
      font-size: 24px;
      overflow: hidden;
      display: inline-block;
    display: flex;
    justify-content: center;
  }
  .Quizzical{
    padding:2.5rem;
  flex-wrap: wrap;
    position: relative;
      font-size: 24px;     
      /* display: inline-block; */
    display: flex;
    justify-content: center;
    align-items: center;
     font-size: 4rem;
  }

 .categories{
  margin-right:2.7rem;
  margin-top: 4rem;
  display:flex;
  justify-content: center;
  flex-wrap: wrap;
  padding-bottom:1rem;
 }
  /* h1,p{
    color:black;
    font-size:1rem;  
    padding:2rem; 
  } */
  .title{
    flex-wrap: wrap;
    padding: 1rem;
    margin-top:8rem;
    color: white;
   /* display: inline-block; */
   /* width: 100%; */
   background-image: url("../assets/bg2.webp");
   background-repeat: no-repeat; /* Prevent image from repeating */
  background-size: cover;
  
  }
  .link{
    font-size: .5rem;
    text-decoration: none;
    text-transform: uppercase;
  }
}
@media screen and (min-width: 244px){
  /* h1,p,.title{
    color:white;
    font-size:2rem;   
  } */
}
@media screen and (min-width: 658px){

.title {
  font-size: 3rem;
}
h1,
p,.link {
  font-size: 1.5rem;
}
.home {

  color: white;
}

}
</style>
