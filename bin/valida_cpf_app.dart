import 'package:valida_cpf_app/cpf.dart';

void main() {
  //String? info = stdin.readLineSync();

  CPF cpf = CPF('44822515850');
  CPF cpf2 = CPF('37236387240');

  //cpf.cpfLength();
  print(cpf.isCpfValid());
  print(cpf2.isCpfValid());
}
