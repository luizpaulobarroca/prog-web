import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import "@mdi/font/css/materialdesignicons.css";
import Buefy from "buefy";
import VModal from "vue-js-modal";
import Vuelidate from "vuelidate";
import VueTheMask from "vue-the-mask";
import Notifications from 'vue-notification'

Vue.use(Buefy, {
  defaultMonthNames: [
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro"
  ],
  defaultDayNames: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"],
  defaultIconPack: "mdi"
});

Vue.use(Vuelidate);
Vue.use(VModal, { dynamic: true, dialog: true });
Vue.use(VueTheMask);
Vue.use(Notifications);
Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
