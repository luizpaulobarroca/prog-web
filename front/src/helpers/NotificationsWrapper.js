import Vue from "vue";

const group = "notifications";

export default {
  success: message => {
    Vue.notify({
      group: group,
      title: "Sucesso",
      text: message,
      type: "success"
    });
  },
  error: message => {
    Vue.notify({
      group: group,
      title: "Erro",
      text: message,
      type: "error"
    });
  }
};
