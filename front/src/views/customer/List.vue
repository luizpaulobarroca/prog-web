<template>
  <div class="section">
    <div class="columns is-multiline holder">
      <div class="column is-12 has-text-right">
        <button class="button is-primary" @click="openCreateEditModal({})">Novo</button>
      </div>
      <div class="column is-12">
        <table class="table is-fullwidth">
          <thead>
          <tr>
            <th>Nome completo / Razão social</th>
            <th>CPF / CNPJ</th>
            <th>Email</th>
            <th></th>
          </tr>
          </thead>
          <tbody>
          <tr v-for="customer in customers" :key="customer.id">
            <td>{{customer.name}}</td>
            <td>{{customer.cpfCnpj}}</td>
            <td>{{customer.email}}</td>
            <td >
              <div class="options-holder">
                <a class="option" @click="edit(customer)">Editar</a>
                <a class="option remove-icon is-danger" @click="remove(customer)">Remover</a>
              </div>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
  import CreateOrEdit from "./CreateOrEdit";
  import NotificationsWrapper from "../../helpers/NotificationsWrapper";
  import HTTP from "../../helpers/Http";

  export default {
    name: "List",
    data: function () {
      return {
        customers: []
      }
    },
    methods:{
      getAllItems(){
        HTTP.get("customers").then(({ data }) => {
          this.customers = data.content;
        });
      },
      edit(item){
        this.openCreateEditModal(item);
      },
      remove(item){
        let message = `Deseja realmente confirmar a exclusão de ${item.name}?`;
        let successMessage = `${item.name} excluído com sucesso.`;
        let errorMessage = `Houve um erro ao tentar  excluir ${item.name}. Tente novamente.`;
        this.$modal.show("dialog", {
          title: "Aviso de exclusão!",
          text: message,
          buttons: [
            {
              title: "Excluir",
              class: "vue-dialog-button error",
              handler: () => {
                HTTP.delete("/customers/" + item.id)
                    .then(() => {
                      NotificationsWrapper.success(successMessage);
                      this.$modal.hide("dialog");
                      this.getAllItems();
                    })
                    .catch(() => {
                      NotificationsWrapper.error(errorMessage);
                    });
              }
            },
            {
              title: "Cancelar", // Button title
              default: true, // Will be triggered by default if 'Enter' pressed.,
              handler: () => {
                this.$modal.hide("dialog");
              }
            }
          ]
        });
      },
      openCreateEditModal(customer){
        let object = { };
        if (!(Object.entries(customer).length === 0 && customer.constructor === Object)) {
          object = {
              id: customer.id,
              type: customer.type,
              name: customer.name,
              cpf: customer.cpf,
              email: customer.email,
              phone: customer.phone,
              cep: customer.address.cep,
              street: customer.address.street,
              number: customer.address.number,
              complement: customer.address.complement,
              city: customer.address.city,
              uf: customer.address.uf,
              pets: customer.pets
            }
          }
          this.$modal.show(
            CreateOrEdit,
            { itemParam: object},
            { width: "800px", height: "auto", adaptive: true, scrollable: true },
            {
              closed: () => {
                this.getAllItems();
              }
            }
        );
      }
    },
    mounted() {
      this.getAllItems();
    }
  }
</script>

<style lang="scss" scoped>
  @import "../../assets/css/variables";
.remove-icon{
  &:hover{
    color: $red;
  }
}
  .holder{
    background-color: white;
    margin-top: 25px;
    padding: 15px;
    border-radius: 15px;
  }
</style>
