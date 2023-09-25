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
.card {
    width: 200px;
    padding: 16px;
    background-color: beige;
    border: 1px solid #ccc;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
    cursor: pointer;
    transition: box-shadow 0.3s ease;
    margin: 16px;
  }
  
  .card:hover {
    box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.4);
  }
</style>