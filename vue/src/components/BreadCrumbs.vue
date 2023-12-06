<!-- components/Breadcrumbs.vue -->

<template>
  <b-breadcrumb :items="breadcrumbItems"></b-breadcrumb>
</template>

<script>
export default {
  computed: {
    breadcrumbItems() {
      const matchedRoutes = this.$route.matched;

      return matchedRoutes.map(route => ({
        text: route.meta.breadcrumb || route.name,
        to: route.path,
      }));
    },
  },
};
</script>

<style scoped>
/* Add your breadcrumb styling here */
</style>
