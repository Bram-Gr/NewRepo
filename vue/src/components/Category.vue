<template>
  
  <div class="card">
<h1 class="category-name"><div  @click="emitAlert">{{ category.categoryName }}</div></h1>
  </div>

</template>

<script>
export default {
 name:'category',
 props:{
  category:Object
 },
 methods: {
    emitAlert() {
      this.$emit('show-alert');
    },
  },
}
</script>

<style>

.category-name{
  color:white;
  padding: .3rem;
}
.card {
  min-height: 10rem;
  text-align: center;
  margin-top:1rem;
  height: 10rem;
  margin-left:1rem;
  display: flex;
justify-content: center;
align-items:center;
width:20rem;
background: linear-gradient(to bottom, #4a148c, #311b92);
border-radius: 10px;
  }
  

</style>