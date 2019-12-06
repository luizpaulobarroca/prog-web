<template>
  <nav class="navbar" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
      <a class="navbar-item">
        Marca
      </a>

      <a
          role="button"
          @click="toggleIsOpen()"
          class="navbar-burger burger"
          aria-label="menu"
          aria-expanded="false"
          data-target="navbarBasicExample"
      >
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
      </a>
    </div>

    <div
        id="navbarBasicExample"
        class="navbar-menu"
        v-bind:class="{ 'is-active': isOpen }"
    >
      <div class="navbar-start">
        <router-link class="navbar-item" :to="{ name: 'customer' }"
        >Home
        </router-link
        >

        <router-link
            class="navbar-item"
            :to="{
            name: 'customer'
          }"
        >
          Clientes
        </router-link>
      </div>

      <div class="navbar-end">
        <div class="navbar-item">
          <span>
            Olá,
            <b
            ><a>Admin.</a></b
            >
          </span>
          <a class="navbar-item">Logout</a>
        </div>
      </div>
    </div>
  </nav>

</template>

<script>
  export default {
    name: "NavBar",
    data: () => ({isOpen: false}),
    methods: {
      toggleIsOpen() {
        this.isOpen = !this.isOpen;
      },
      close(e) {
        let items = document.getElementsByClassName("navbar-item has-dropdown");

        for (let i = 0; i < items.length; i++) {
          if (items[i].contains(e.target)) {
            items[i].classList.toggle("is-active");
            window.scrollTo(0, 0);
          } else {
            items[i].classList.remove("is-active");
          }
        }
        if (e.target.className.includes("navbar-item")) {
          this.isOpen = false;
          window.scrollTo(0, 0);
        }
      }
    },
    created() {
      window.addEventListener("click", this.close);
    },
    beforeDestroy() {
      window.removeEventListener("click", this.close);
    }
  };
</script>

<style lang="scss" scoped>
  /*@import "../assets/css/variables";

  .navbar-item.router-link-exact-active.router-link-active {
    background-color: $primary;
    color: $white;
  }*/
</style>
