<template>
  <div id="login">
    <div class="form-container">
    <form @submit.prevent="login">
      <h1 >Please Sign In</h1>
      <div role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <div class="form-input-group">
        <label for="username">Username:</label>
        <input class="input" type="text" id="username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password">Password:</label>
        <input class="input" type="password" id="password" v-model="user.password" required />
      </div>
      <button class="sign-in" type="submit">Submit</button>
      <p>
      <router-link class="route"  :to="{ name: 'register' }">Need an account? Sign up.</router-link></p>
    </form>
  </div>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      this.user.username = this.user.username.toLocaleLowerCase();
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/select-page");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  },
  created(){
    window.scrollTo(0, 0);
  }
};
</script>

<style scoped>
h1{
  text-align: left;
}
.input{
  margin-top: .3rem;
  background-color: transparent;
  border: .5px solid #427AA1 ;
}
button.sign-in{
background-color: rgb(94, 94, 94);
}
.sign-in{
  margin-top: 1rem;
  margin-left:10rem;
  margin-bottom: 1rem;
  cursor: pointer;
  color: white;
}
h1{
  font-size: 2rem;
  margin-bottom: 2rem;
}
p .route, .form-container, .input{
  /* font-size:1rem; */
  background-color: transparent;
  color: #064789;
  font-size: 1.5rem;
}
.form-container{
  border-radius: 10px;
  outline: 1px solid #A5BE00;
  text-align: right;
  display: flex;
  padding:1rem;
padding-right: 1.5rem;
padding-left: 1.5rem;
 align-items: center;
  justify-content: center;
  background: #EBF2FA;
  margin-top: 8rem;
}

#login{
  margin-top: 1rem;
  justify-content: center;
  display: flex;
}
.form-input-group {
  margin-bottom: 1rem;
}
label {
  margin-right: 0.5rem;
}
</style>