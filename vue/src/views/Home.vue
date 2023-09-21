<template>
  <div class="home">
    <h1>Welcome To Quizzical!</h1>
    <p>Browse Categories to Select a Qiuz</p>

   <router-link 
   :to="{name: 'category', params: {id: category.categoryId}}"
   v-for="category in categories" :key="category.categoryId">
    <category :category="category"/>
   </router-link>
   
  </div>
</template>

<script>
import CategoryService from '../services/CategoryService';
import Category from '../components/Category';
export default {
  components:{Category},
  name: "home",
  data(){
    return{
      category:'',
      categories:[]
    }
  },
  created(){
    CategoryService.getCategories().then((response)=>{
      this.categories = response.data;
    })
  }
};
</script>
