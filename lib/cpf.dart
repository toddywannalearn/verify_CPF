class CPF {
  String _cpf = '';

  CPF(String cpf) {
    _cpf = removeMask(cpf);
  }

  get cpf => _cpf;

  /// Removes the CPF formatting
  String removeMask(String cpf) {
    return cpf.replaceAll(RegExp(r'[^\d]'), '');
  }

  /// Returns true if the CPF is valid and false if it's not
  bool isCpfValid() {
    bool isCpfLength = isCpfLengthValid(_cpf);

    if (!isCpfLength) {
      return false;
    }

    bool isFirstDigitValid = _verifyDigit(isFirstDigit: true);
    bool isSecondDigitValid = _verifyDigit(isFirstDigit: false);

    if (isFirstDigitValid && isSecondDigitValid) {
      return true;
    } else {
      return false;
    }
  }

  /// Validates if the CPF length is valid or not, returning true in case it is valid
  bool isCpfLengthValid(String cpf) {
    return cpf.length == 11;
  }

  /// Checks if the digit is valid or not
  bool _verifyDigit({required bool isFirstDigit}) {
    if (isFirstDigit == true) {
      return _isDigitValid(_calculateDigitRemainder(9), int.parse(_cpf[9]));
    } else {
      return _isDigitValid(_calculateDigitRemainder(10), int.parse(_cpf[10]));
    }
  }

  /// Checks if the digit is valid by comparing it with the calculation of its remainder
  bool _isDigitValid(int remainder, int digito) {
    if (remainder < 2) {
      return digito == 0;
    } else if (remainder >= 2) {
      return digito == 11 - remainder;
    } else {
      return false;
    }
  }

  /// Calculates the digit remainder by receiving the index of the digit
  int _calculateDigitRemainder(int indexDigito) {
    List<int> cpf =
        _convertToIntList(_cpf).sublist(0, indexDigito).reversed.toList();

    int digitValue = 0;
    int length = cpf.length;
    int multiplierCount = 2;

    for (int index = 0; index < length; index++) {
      digitValue = digitValue + cpf[index] * multiplierCount++;
    }

    return digitValue % 11;
  }

  /// Converts a string to a list of integers
  List<int> _convertToIntList(String cpf) {
    return cpf.split('').map((el) => int.parse(el)).toList();
  }
}


//448.225.158-50
//44822515850

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

//remover formatacao

//validar se o cpf é valido
// - numero de caracteres igual a 11
// - validacao do primeiro digito
// - validacao do segundo digito
