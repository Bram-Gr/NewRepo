<template>
  <div class="card">
<h1><div @click="emitAlert">{{ category.categoryName }}</div></h1>
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
h1{
  
  display: flex;
  justify-self: center;
  align-self: center;
  color:white;
  padding: .3rem;
}
.card {
  margin-top:1rem;
  height: 10rem;
  margin-left:1rem;
  display: flex;
  flex-wrap: wrap;
width:20rem;
border: 4px solid #FFF;
background: transparent;
  }
  

</style>