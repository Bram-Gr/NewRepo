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
      <button class="sign-in" type="submit">Sign in</button>
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
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>
.input{
  background-color: transparent;
  border: .5px dashed white;
}
.sign-in{
  /* margin-left: 10rem; */
  border:none;
  margin-bottom: 1rem;
  cursor: pointer;
}
h1{
  font-size: 2rem;
}
h1, p .route, .form-container, .input, .sign-in{
  /* font-size:1rem; */
  background-color: transparent;
  color:white;
  font-family: 'Permanent Marker', cursive;
  text-decoration: none;
}
.form-container{
  margin-top: 8rem;
 display: flex;
 align-items: center;
  justify-content: center;
}

#login{
  height: 100vh;
}
.form-input-group {
  margin-bottom: 1rem;
}
label {
  margin-right: 0.5rem;
}
</style>