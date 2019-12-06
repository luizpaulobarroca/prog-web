import Vue from "vue";
import Router from "vue-router";
import Customer from "./views/customer/Customers";
import List from "./views/customer/List";

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/customers",
      name: "customer",
      redirect: {name: "customers"},
      component: Customer, children: [{
        path: "/all", name: "customers", component: List
      }]
    }
  ]
});
