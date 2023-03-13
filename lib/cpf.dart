class CPF {
  String _cpf = '';

  get cpf => _cpf;

  CPF(String cpf) {
    _cpf = cpf;
  }

  // Encapsulamento
  // Abstração
  // Herança
  // Poliformismo

  //validaCPF() {}

  //448.225.158-50

  /*
  8 . 2 - 16 => 128
  5 . 3 - 15 => 75
  1 . 4 - 4 => 4
  5 . 5 - 25 => 125
  2 . 6 - 12 => 24
  2 . 7 - 14 => 28
  8 . 8 - 64 => 512
  4 . 9 - 36 => 144
  4 . 10 - 40 => 160

  226 % 11 = 6

  6 >= 2

  11 - 6 = 5 (digito 1)

  5 . 2 - 10
  8 . 3 - 24
  5 . 4 - 20
  1 . 5 - 5
  5 . 6 - 30
  2 . 7 - 14
  2 . 8 - 16
  8 . 9 - 72
  4 . 10 - 40
  4 . 11 - 44

  275 % 11 = 0

  0 >= 2 = 0 (digito 2)

  */

  /*
 1. O primeiro passo é calcular o primeiro dígito verificador, e para isso,
  separamos os primeiros 9 dígitos do CPF (111.444.777) e
   multiplicamos cada um dos números, da direita para a esquerda por números crescentes a partir do número 2.
 */

  // cpfLength() {
  //   print('length: ${_fullCPF.substring(0, 9).length}');
  //   print(_fullCPF.substring(0, 9));
  //   print(_fullCPF.substring(0, 9)[8]);
  // }

  bool isDigitoValido(int digito) {
    if (calcDigito(digito) < 2) {
      //print('${_cpf[digito]} == ${calcDigito(digito)}');
      return int.parse(_cpf[digito]) == 0;
    } else {
      //print('${_cpf[digito]} == ${11 - calcDigito(digito)}');
      return int.parse(_cpf[digito]) == 11 - calcDigito(digito);
    }
  }

  bool isCpfValid() {
    if (isDigitoValido(9) && isDigitoValido(10)) {
      return true;
    } else {
      return false;
    }
  }

  int calcDigito(int digitos) {
    String inicioCPF = _cpf.substring(0, digitos);

    int resultado = 0;
    int length = inicioCPF.length - 1;

    for (int i = 0; i <= length; i++) {
      resultado = resultado + int.parse(inicioCPF[length - i]) * (2 + i);
    }

    //print('resultado: $resultado - resto: ${resultado % 11}');

    return (resultado % 11);
  }
}
