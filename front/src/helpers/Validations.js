const isValidCNPJ = function(cnpj) {
  if (cnpj === "") return false;

  cnpj = cnpj.replace(/[^\d]+/g, "");
  if (cnpj.length !== 14) return false;
  // Elimina CNPJs invalidos conhecidos

  if (
    cnpj === "00000000000000" ||
    cnpj === "11111111111111" ||
    cnpj === "22222222222222" ||
    cnpj === "33333333333333" ||
    cnpj === "44444444444444" ||
    cnpj === "55555555555555" ||
    cnpj === "66666666666666" ||
    cnpj === "77777777777777" ||
    cnpj === "88888888888888" ||
    cnpj === "99999999999999"
  )
    return false;
  // Valida DVs
  let tamanho = cnpj.length - 2;

  let numeros = cnpj.substring(0, tamanho);
  let digitos = cnpj.substring(tamanho);
  let soma = 0;
  let pos = tamanho - 7;
  for (let i = tamanho; i >= 1; i--) {
    soma += numeros.charAt(tamanho - i) * pos--;
    if (pos < 2) pos = 9;
  }
  let resultado = soma % 11 < 2 ? 0 : 11 - (soma % 11);

  if (resultado != digitos.charAt(0)) return false;

  tamanho = tamanho + 1;
  numeros = cnpj.substring(0, tamanho);
  soma = 0;
  pos = tamanho - 7;
  for (let i = tamanho; i >= 1; i--) {
    soma += numeros.charAt(tamanho - i) * pos--;
    if (pos < 2) pos = 9;
  }
  resultado = soma % 11 < 2 ? 0 : 11 - (soma % 11);
  return resultado == digitos.charAt(1);
};
const isValidCPF = function(CPF) {
  if (CPF === "") return false;
  CPF = CPF.replace(/[^\d]+/g, "");

  if (CPF.length !== 11) return false;
  var Soma;
  var Resto;
  Soma = 0;
  if (CPF == "00000000000") return false;
  {
    for (let i = 1; i <= 9; i++) {
      Soma = Soma + parseInt(CPF.substring(i - 1, i)) * (11 - i);
    }
  }
  Resto = (Soma * 10) % 11;

  if (Resto == 10 || Resto == 11) Resto = 0;
  if (Resto != parseInt(CPF.substring(9, 10))) return false;

  Soma = 0;
  for (let i = 1; i <= 10; i++)
    Soma = Soma + parseInt(CPF.substring(i - 1, i)) * (12 - i);
  Resto = (Soma * 10) % 11;

  if (Resto == 10 || Resto == 11) Resto = 0;
  if (Resto != parseInt(CPF.substring(10, 11))) return false;

  return true;
};

const isValidCPFCNPJ = function(value) {
  if (!value) {
    return false;
  }
  value = value.replace(/[^\d]+/g, "");
  return isValidCPF(value) || isValidCNPJ(value);
};
export default {
  isValidCPFCNPJ,
  isValidCNPJ,
  isValidCPF
};
