<template>
  <div class="card">
<h1>{{ category.categoryName }}</h1>
  </div>
</template>

<script>
export default {
 name:'category',
 props:{
  category:Object
 }
}
</script>

<style>
h1{
  color:black;
}
.card{
    background-color:blue;
}
</style>