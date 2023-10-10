<template>
  <modal name="my-modal">
    <div class="modal">
      <h2>{{ title }}</h2>
      <p>{{ content }}</p>
      <button @click="closeModal">Close</button>
    </div>
  </modal>
</template>

<script>
export default {
  props: {
    title: String,
    content: String,
  },
  methods: {
    closeModal() {
      this.$emit('closeModal'); // Close the modal when the "Close" button is clicked
    },
  },
};
</script>

<style scoped>
/* Add your modal styles here */
.modal {
  background-color: white;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h2 {
  font-size: 1.5rem;
}

button {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
  margin-top: 10px;
}
.popup-modal {
  width: 400px; /* Set the desired width */
  padding: 20px;
  background-color: #fff; /* Background color for the modal */
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Box shadow for a pop-up effect */
}
</style>
