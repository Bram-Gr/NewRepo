<template>
  <div id="About">
    <h1>ABOUT</h1>
    <p>
      This version of
      <span style="text-shadow: 0px 0px 1.3px #064789">QUIZZICAL is here</span>
      to help me study as I keep myself afloat in the
      <span style="font-style: italic; font-weight: bold">vast sea</span> of job
      rejections uponst which I sail. QUIZZICAL's roadmap entails a profile page
      where users can personalize their experience with a user icon and see
      their quizzes/favorited quizzes.
    </p>
    <p>
      Future updates will include the
      <span style="text-shadow: 0px 0px 1.3px #064789">Community Quiz</span>
      category where all users can submit their quizzes to the quiz-fam. Any
      flagged quizzes will be reviewed and are subject to removal. Top quizzes
      will be featured and plans for
      <span style="font-style: italic; font-weight: bold"
        >AI generated multiple choice options</span
      >
      are in the works as well.
    </p>
  </div>
</template>

<style scoped>
@media screen and (min-width: 200px) {
  p,
  h1 {
    font-family: Dhurjati;
  }
  #About {
    padding-top: 2rem;
    color: black;
  }
  h1 {
    font-size: 3rem;
    padding-top: 5rem;
    display: flex;
    justify-content: center;
    align-items: center;
    padding-bottom: 2rem;
  }
  p {
    padding-right: 2rem;
    padding-left: 2rem;
    font-size: 1rem;
  }
  button {
    cursor: pointer;
    font-size: 1.2rem;
    text-align: center;
    padding: 2rem;
    margin-top: 1rem;
    margin-left: 1rem;

    color: white;
    background: linear-gradient(to bottom, #4a148c, #311b92);
    border-radius: 10px;
  }
  .button-container {
    display: flex;
    justify-content: center;
    align-items: center;
  }
}
@media screen and (min-width: 750px) {
  p {
    padding-right: 10rem;
    padding-left: 10rem;
    font-size: 1.3rem;
  }
}
</style>