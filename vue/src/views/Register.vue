<template>
  <div id="register" class="text-center">
    <div class="form-container">
    <form @submit.prevent="register">
      <h1>Create Account</h1>
      <div role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div class="form-input-group">
        <label for="username">Username:</label>
        <input class="input" type="text" id="username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password">Password: </label>
        <input class="input" type="password" id="password" v-model="user.password" required />
      </div>
      <div class="form-input-group">
        <label for="confirmPassword">Confirm Password:</label>
        <input class="input" type="password" id="confirmPassword" v-model="user.confirmPassword" required />
      </div>
      <button class="register" type="submit">Submit</button>
      <p><router-link class="route" :to="{ name: 'login' }">Already have an account? Log in.</router-link></p>
    </form>
  </div>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      this.user.username = this.user.username.toLowerCase();
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
  created(){
    window.scrollTo(0, 0);
  }
};
</script>

<style scoped>
.input{
  margin-top: .3rem;
  background-color: transparent;
  border: .5px solid #427AA1 ;

}
button.register{
  margin-top: 1rem;
  margin-left:12rem;
  margin-bottom: 1rem;
  cursor: pointer;
  background-color: rgb(94, 94, 94);
  color: white;
}
h1{
  text-align: left;
  font-size: 2rem;
  margin-bottom: 2rem;
}
 p .route, .form-container, .input, .register{
  
  background-color: transparent;
  color: #064789;
  font-size: 1.5rem;
}

#register{
  margin-top: 1rem;
  justify-content: center;
  display: flex;
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

.form-input-group {
  margin-bottom: 1rem;
}
label {
  margin-right: 0.5rem;
}
</style>
