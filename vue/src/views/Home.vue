<template>
  <div id="home">
    <h1>Welcome to QUIZZICAL, a web appliction I've developed to help me remember stuff. Create an account, make note cards, and you can do the same!</h1>

    <div class="button-container">
    <b-button variant="primary" block @click="select">Get Started</b-button>
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

@media  screen and (min-width: 200px) {

  #home{
    padding-top: 5rem;
  color: black;
}
h1{
    padding: 3rem;
    text-align: center;
    font-size: 1rem;
    display: flex;
    justify-content: center;
    align-items: center;
    padding-bottom: 3rem;
}

  .button-container{
    display: flex;
justify-content: center;
align-items:center;
  }
}
@media  screen and (min-width: 500px) {
 #home{
  padding-top: 7rem;
 }
h1{
  padding-top: 7rem;
  font-size: 2rem;
}
}
</style>