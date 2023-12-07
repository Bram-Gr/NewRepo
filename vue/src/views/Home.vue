<template>
  <div id="home">
    <h1>Welcome to QUIZZICAL, a full stack appliction I've developed to help me remember stuff. You can do the same!</h1>

    <div class="button-container">
    <button @click="select">Get Started</button>
  </div>
  </div>
</template>
<script>
export default {
methods:{
    select(){
      this.$router.push('/select-page');

    }
}
}
</script>

<style scoped>
#home{
    padding-top: 7rem;
  color: white;
}
h1{
    padding: 3rem;
    text-align: center;
    font-size: 2rem;
    padding-top: 7rem;
    display: flex;
    justify-content: center;
    align-items: center;
    padding-bottom: 3rem;
}
button{
  cursor: pointer;
  font-size: 1.2rem;
  text-align: center;
  padding:2rem;
  margin-top:1rem;
  margin-left:1rem;
 
color: white;
background: linear-gradient(to bottom, #4a148c, #311b92);
border-radius: 10px;
  }
  .button-container{
    display: flex;
justify-content: center;
align-items:center;
  }
</style>