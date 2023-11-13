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
  color:white;
  margin-left: 1.5rem;
}
.card {
  border-radius: 52px;
border-left: 4px solid #FFF;

background: rgba(255, 253, 253, 0.00);

box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
  }
  
  .card:hover {
    /* box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.4); */
    font-family: 'Permanent Marker', cursive;
  }
</style>