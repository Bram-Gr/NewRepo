<template>
  <div id="home">
    <h1>Welcome to QUIZZICAL, a full stack appliction I've developed to help me remember stuff. You can do the same!</h1>

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
#home{
    padding-top: 7rem;
  color: black;
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

  .button-container{
    display: flex;
justify-content: center;
align-items:center;
  }
</style>