<template>
  <div class="app-modal">
    <div class="header">
      <h1 class="subtitle is-4 has-text-left" v-if="itemParam.id">Edição de cliente</h1>
      <h1 class="subtitle is-4 has-text-left" v-else>Criação de cliente</h1>
      <span class="close-button" @click="$emit('close')">
        <i class="mdi mdi-window-close"></i>
      </span>
    </div>
    <div class="body">
      <form
          action=""
          novalidate
          @submit.prevent="validateBeforeSubmit"
          class="has-text-left columns is-multiline is-variable form-holder"
      >
        <div class="column is-6">
          <label class="label">Tipo de cliente</label>
          <b-field>
            <b-radio
                v-model="customer.type"
                native-value="PHYSICAL"
            >
              Pessoa física
            </b-radio>
            <b-radio
                v-model="customer.type"
                native-value="LEGAL"
            >
              Pessoa jurídica
            </b-radio>
          </b-field>
        </div>
        <div class="column is-8">
          <div
              class="field"
              :class="{
                'input-error': !$v.customer.name.required && $v.customer.name.$error
              }"
          >
            <label class="label" for="customerName" v-if="customer.type  === 'PHYSICAL'">Nome completo</label>
            <label class="label" for="customerName" v-else>Razão social</label>
            <div class="control">
              <input
                  type="text"
                  id="customerName"
                  name="customerName"
                  class="input"
                  v-model.trim="$v.customer.name.$model"
              />
              <b-tooltip
                  label="Campo requerido"
                  type="is-danger"
                  v-if="!$v.customer.name.required && $v.customer.name.$error"
              >
                  <span class="error-icon has-text-danger"
                  ><i class="mdi mdi-alert-circle"></i
                  ></span>
              </b-tooltip>
            </div>
          </div>
        </div>

        <div class="column is-4" v-if="customer.type === 'PHYSICAL'">
          <div class="field" :class="{'input-error': (!$v.cpf.$required ||
                !$v.cpf.$isEntityValidCPF) && $v.cpf.$error}">
            <label for="customerName" class="label">CPF</label>

            <input type="tel" id="cpf" class="input" name="cpf" v-mask="'###.###.###-##'"
                   v-model.trim="$v.cpf.$model">
            <b-tooltip label="Informe um CPF válido." multilined type="is-danger"
                       v-if="(!$v.cpf.$required ||
              !$v.cpf.$isEntityValidCPF) && $v.cpf.$error">
              <span class="error-icon has-text-danger"><i class="mdi mdi-alert-circle"></i></span>
            </b-tooltip>

          </div>
        </div>
        <div class="column is-4" v-else>
          <div class="field" :class="{'input-error': (!$v.CNPJ.$required ||
                !$v.CNPJ.$isValidCNPJ) && $v.CNPJ.$error}">
            <label for="customerName" class="label">CNPJ</label>

            <input type="tel" id="CNPJ" class="input" name="CNPJ" v-mask="'##.###.###/####-##'"
                   v-model.trim="$v.CNPJ.$model">
            <b-tooltip label="Informe um CNPJ válido." multilined type="is-danger"
                       v-if="(!$v.CNPJ.$required ||
              !$v.CNPJ.$isValidCNPJ) && $v.CNPJ.$error">
              <span class="error-icon has-text-danger"><i class="mdi mdi-alert-circle"></i></span>
            </b-tooltip>

          </div>
        </div>

        <div class="column is-6">
          <div
              class="field"
              :class="{
            'input-error':
              (!$v.customer.email.required || !$v.customer.email.minLength) &&
              $v.customer.email.$error
          }"
          >
            <label class="label" for="email">Email</label>
            <div class="control">
              <input
                  type="email"
                  id="email"
                  name="email"
                  class="input"
                  v-model.trim="$v.customer.email.$model"
              />
              <b-tooltip
                  label="Campo requerido"
                  type="is-danger"
                  v-if="
                (!$v.customer.email.required || !$v.customer.email.minLength) &&
                  $v.customer.email.$error"
              >
              <span class="error-icon has-text-danger"
              ><i class="mdi mdi-alert-circle"></i
              ></span>
              </b-tooltip>
            </div>
          </div>
        </div>
        <div class="column is-6">
          <div
              class="field"
              :class="{
                'input-error':
                  (!$v.customer.phone.required || !$v.customer.phone.minLength) &&
                  $v.customer.phone.$error
              }"
          >
            <label class="label" for="customerPhone">Telefone para contato</label>
            <div class="control">
              <input
                  type="text"
                  id="customerPhone"
                  name="customerPhone"
                  v-mask="['(##) #####-####', '(##) ####-####']"
                  class="input"
                  v-model.trim="$v.customer.phone.$model"
              />
              <b-tooltip
                  label="Campo requerido"
                  type="is-danger"
                  v-if="
                    (!$v.customer.phone.required || !$v.customer.phone.minLength) &&
                      $v.customer.phone.$error
                  "
              >
                  <span class="error-icon has-text-danger"
                  ><i class="mdi mdi-alert-circle"></i
                  ></span>
              </b-tooltip>
            </div>
          </div>
        </div>

        <div class="column is-3">
          <div
              class="field"
              :class="{
            'input-error':
              (!$v.customer.cep.required || !$v.customer.cep.minLength) &&
              $v.customer.cep.$error
          }"
          >
            <label class="label" for="customercep">CEP</label>
            <div class="control">
              <input
                  type="tel"
                  id="customercep"
                  name="customercep"
                  v-mask="['#####-###']"
                  class="input"
                  v-model.trim="$v.customer.cep.$model"
              />
              <b-tooltip
                  label="Campo requerido"
                  type="is-danger"
                  v-if="
                (!$v.customer.cep.required || !$v.customer.cep.minLength) &&
                  $v.customer.cep.$error
              "
              >
              <span class="error-icon has-text-danger"
              ><i class="mdi mdi-alert-circle"></i
              ></span>
              </b-tooltip>
            </div>
          </div>
        </div>

        <div class="column is-7">
          <div
              class="field"
              :class="{
            'input-error':
              !$v.customer.street.required && $v.customer.street.$error
          }"
          >
            <label class="label" for="customerAddress">Rua</label>
            <div class="control">
              <input
                  type="text"
                  id="customerAddress"
                  name="customerAddress"
                  v-model.trim="$v.customer.street.$model"
                  class="input"
              />
              <b-tooltip
                  label="Campo requerido"
                  type="is-danger"
                  v-if="!$v.customer.street.required && $v.customer.street.$error"
              >
              <span class="error-icon has-text-danger"
              ><i class="mdi mdi-alert-circle"></i
              ></span>
              </b-tooltip>
            </div>
          </div>
        </div>
        <div class="column is-2">
          <div
              class="field"
              :class="{
            'input-error':
              !$v.customer.number.required && $v.customer.number.$error
          }"
          >
            <label class="label" for="customerNumber">Número</label>
            <div class="control">
              <input
                  type="text"
                  id="customerNumber"
                  name="customerNumber"
                  v-model.trim="$v.customer.number.$model"
                  class="input"
              />
              <b-tooltip
                  label="Campo requerido"
                  type="is-danger"
                  v-if="!$v.customer.number.required && $v.customer.number.$error"
              >
              <span class="error-icon has-text-danger"
              ><i class="mdi mdi-alert-circle"></i
              ></span>
              </b-tooltip>
            </div>
          </div>
        </div>
        <div class="column is-6">
          <div
              class="field"
              :class="{
            'input-error':
              !$v.customer.complement.required && $v.customer.complement.$error
          }"
          >
            <label class="label" for="customerComplement">Complemento</label>
            <div class="control">
              <input
                  type="text"
                  id="customerComplement"
                  name="customerComplement"
                  v-model.trim="$v.customer.complement.$model"
                  class="input"
              />
              <b-tooltip
                  label="Campo requerido"
                  type="is-danger"
                  v-if="
                !$v.customer.complement.required && $v.customer.complement.$error
              "
              >
              <span class="error-icon has-text-danger"
              ><i class="mdi mdi-alert-circle"></i
              ></span>
              </b-tooltip>
            </div>
          </div>
        </div>

        <div class="column is-4">
          <div
              class="field"
              :class="{
            'input-error': !$v.customer.city.required &&
              $v.customer.city.$error
          }"
          >
            <label class="label" for="customerCity">Cidade</label>
            <div class="control">
              <input
                  type="text"
                  id="customerCity"
                  name="customerCity"
                  v-model.trim="$v.customer.city.$model"
                  class="input"
              />
              <b-tooltip
                  label="Campo requerido"
                  type="is-danger"
                  v-if="!$v.customer.city.required && $v.customer.city.$error"
              >
              <span class="error-icon has-text-danger"
              ><i class="mdi mdi-alert-circle"></i
              ></span>
              </b-tooltip>
            </div>
          </div>
        </div>
        <div class="column is-2">
          <div
              class="field"
              :class="{
            'input-error':
              (!$v.customer.uf.required || !$v.customer.uf.minLength) &&
              $v.customer.uf.$error
          }"
          >
            <label class="label" for="customerState">Estado (UF)</label>
            <div class="control">
              <input
                  type="text"
                  id="customerState"
                  name="customerState"
                  v-mask="['AA']"
                  class="input"
                  v-model.trim="$v.customer.uf.$model"
              />
              <b-tooltip
                  label="Campo requerido"
                  type="is-danger"
                  v-if="
                (!$v.customer.uf.required || !$v.customer.uf.minLength) &&
                  $v.customer.uf.$error
              "
              >
              <span class="error-icon has-text-danger"
              ><i class="mdi mdi-alert-circle"></i
              ></span>
              </b-tooltip>
            </div>
          </div>
        </div>
        <!--pets-->
        <div class="column is-12">
          <label class="label">Pets</label>
          <table class="table is-fullwidth">
            <thead>
            <tr>
              <th>Nome</th>
              <th>Raça</th>
              <th>Peso</th>
              <th>Data de nascimento</th>
              <th></th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(pet, index) in customer.pets" :key="pet.id">
              <td>
                <input class="input" type="text" v-model.trim="pet.name">
              </td>
              <td>
                <input class="input" type="text" v-model.trim="pet.specie">
              </td>
              <td>
                <input class="input" type="number" v-model.trim="pet.weight">
              </td>
              <td>
                <input class="input" type="date" v-model.trim="pet.birthDate">
              </td>
              <td>
                <a @click="addPet(pet)" v-if="index === (customer.pets.length-1)">Adicionar</a>
                <a @click="removePet(pet)" v-else>Remover</a>
              </td>
            </tr>
            </tbody>
          </table>
        </div>

        <div class="column is-12 has-text-right">
          <div class="columns is-variable">
            <div class="column is-12">
              <div class="buttons is-right">
                <a class="button" @click="$emit('close')">
                  <span>Cancelar</span>
                </a>
                <button type="submit" class="button is-primary">
                  <span>Salvar</span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
  import Vue from "vue";
  import Vuelidate from "vuelidate";
  import {required, email, minLength, requiredIf} from "vuelidate/lib/validators";
  import Validations from "../../helpers/Validations";
  import HTTP from "../../helpers/Http";
  import NotificationsWrapper from "../../helpers/NotificationsWrapper";

  Vue.use(Vuelidate);

  const isValidCNPJ = (value, vm) => {
    if (!vm.phisicalPerson) {
      return true;
    }
    return Validations.isValidCNPJ(value);
  };

  const isEntityValidCPF = (value, vm) => {
    if (vm.phisicalPerson) {
      return true;
    }
    return Validations.isValidCPF(value);
  };

  export default {
    name: "CreateOrEdit",
    props: ["itemParam"],
    computed: {
      isPhysicalPerson: function () {
        return this.customer.type === 'PHYSICAL';
      },
    },
    data: function () {
      return {
        customer: {
          type: 'PHYSICAL',
          name: "",
          cpfCnpj: "",
          email: "",
          phone: "",
          cep: "",
          street: "",
          number: "",
          complement: "",
          city: "",
          uf: "",
          pets: []
        },
        CNPJ: "",
        cpf: ""
      }
    },
    validations: {
      customer: {
        required,
        name: {required},
        phone: {required, minLength: minLength(14)},
        uf: {
          required,
          minLength: minLength(2)
        },
        cep: {
          required,
          minLength: minLength(9)
        },
        number: {
          required
        },
        city: {
          required
        },
        street: {
          required
        },
        complement: {
          required
        },
        email: {required, email}
      },
      cpf: {
        required: requiredIf(function (nestedModel) {
          return this.isPhysicalPerson;
        }),
        isEntityValidCPF
      },
      CNPJ: {
        required: requiredIf(function (nestedModel) {
          return !this.isPhysicalPerson;
        }),
        isValidCNPJ
      }
    },
    methods: {
      validateBeforeSubmit() {
        this.$v.$touch();
        let sendObject = {
          type: this.customer.type,
          name: this.customer.name,
          cpf: this.isPhysicalPerson ? this.cpf : this.CNPJ,
          email: this.customer.email,
          phone: this.customer.phone,
          address: {
            cep: this.customer.cep,
            street: this.customer.street,
            number: this.customer.number,
            complement: this.customer.complement,
            city: this.customer.city,
            uf: this.customer.uf
          },
          pets: this.customer.pets.slice(0, this.customer.pets.length-1)
        }
        if (!this.customer.id) {
          HTTP.post("/customers",  sendObject).then(() => {
            NotificationsWrapper.success("Cliente criado com sucesso.");
            this.$emit('close');
          }).catch((a) => {
            NotificationsWrapper.error(a.response.data.errors);
          })
        } else {
          sendObject.id = this.customer.id;
          HTTP.put("/customers/" + this.customer.id, sendObject).then(() => {
            NotificationsWrapper.success("Cliente editado com sucesso.");
            this.$emit('close');
          }).catch((a) => {
            NotificationsWrapper.error(a.response.data.errors);
          })
        }
      },
      addPet(pet) {
        if ((pet.name.length > 0 && pet.specie.length > 0 && pet.weight > 0 && pet.birthDate.toString().length > 0)) {
          setTimeout(() => {
            this.customer.pets.push({
              id: new Date().getTime(),
              name: "",
              weight: 0,
              specie: "",
              birthDate: new Date()
            })
          }, 1)
        }
      },
      removePet(pet) {
        this.customer.pets = this.customer.pets.filter(p => p.id !== pet.id);
      },
      checkAddButton(pet) {
        return !(pet.name.length > 0 && pet.specie.length > 0 && pet.weight > 0 && pet.birthDate.toString().length > 0)
      }
    },
    created() {
      if (this.itemParam.id) {
        this.customer = this.itemParam;
        if (this.isPhysicalPerson) {
         this.cpf = this.itemParam.cpf
        } else {
          this.CNPJ = this.itemParam.cpf
        }
      }
      this.customer.pets.push({
        name: "",
        weight: 0,
        specie: "",
        birthDate: new Date(),
        id: new Date().getTime()
      })
    }
  }
</script>

<style scoped>

</style>
