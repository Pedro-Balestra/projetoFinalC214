import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_final_c214/func/calculate.dart';

void main() {

  group("Cálculos de comissão", () {

    test('Testar cálculo da comissao == 15', () {

      double totalconta = 150;
      double taxa = 10;
      double comissao = 0;

      comissao = calcula_comissao(totalconta, taxa);
      expect(comissao, 15);
    });
  });
}