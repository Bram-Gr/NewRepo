<template>
  <div id="About">
    <h1>ABOUT</h1>
    <p>
        This is the first iteration of QUIZZICAL with many more planned features in the works.
        This version is primarily here to help me study as I keep myself afloat in the vast sea of job rejections
        uponst which I sail. 
    </p>
   <p>
    My roadmap for QUIZZICAL entails a profile page where users can personalize their experience
        with a user icon and see their quizzes/favorited quizzes. Another planned feature is the community quiz category
        where all users can submit their quizzes to the quiz-fam. Any flagged quizzes will be reviewed and are subject 
        to removal. Top quizzes will be featured and plans for AI generated multiple choice options are in the works as well.
   </p>
  </div>
</template>



<style scoped>
#About{
  padding-top: 2rem;
  color: white;
}
h1{
    font-size: 3rem;
    padding-top: 5rem;
    display: flex;
    justify-content: center;
    align-items: center;
    padding-bottom: 2rem;
}
p{
    padding-right:6rem;
    padding-left: 6rem;
    font-size: 1.3rem;
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