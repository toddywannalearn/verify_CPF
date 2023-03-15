import 'dart:io';

import 'package:valida_cpf_app/cpf.dart';

void main() {
  print('Digite um CPF');
  CPF cpf = CPF(stdin.readLineSync() ?? '');
  CPF cpf2 = CPF('44822515850');
  CPF cpf3 = CPF('372.363.872-40');

  print('Is CPF ${cpf.cpf} valid? ${cpf.isCpfValid()}');
  print('Is CPF ${cpf2.cpf} valid? ${cpf2.isCpfValid()}');
  print('Is CPF ${cpf3.cpf} valid? ${cpf3.isCpfValid()}');
}
