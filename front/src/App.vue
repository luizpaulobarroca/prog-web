<template>
  <div id="app">
    <notifications group="notifications"></notifications>
    <modals-container />
    <v-dialog />
    <nav-bar></nav-bar>
    <router-view />
  </div>
</template>

<style lang="scss">
// Import Bulma's core
@import "~bulma/sass/utilities/initial-variables";
@import "~bulma/sass/utilities/functions";
@import "assets/css/variables";
@import "~bulma/sass/utilities/_all";

@import "../node_modules/bulma/bulma";
@import "~buefy/src/scss/buefy";

@import "assets/css/globalFixes";
@import "assets/css/modal";
@import "assets/css/forms";

#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  min-height: 100vh;
  background-color: $lighter-grey;
}
.section {
  padding: 15px 1.5rem !important;
}
</style>
<script>
import NavBar from "./components/NavBar";
export default {
  components: {NavBar}
};
</script>
