import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_final_c214/func/calculate.dart';

void main() {

  group("Testes de Cálculos de comissão", () {

    test('Testar cálculo da comissao == 15', () {

      double totalconta = 150;
      double taxa = 10;
      double comissao = 0;

      comissao = calcula_comissao(totalconta, taxa);
      expect(comissao, 15);
    });

    test('Testar cálculo da comissao == 10', () {

      double totalconta = 100;
      double taxa = 10;
      double comissao = 0;

      comissao = calcula_comissao(totalconta, taxa);
      expect(comissao, 10);
    });

    test('Testar cálculo da comissao == 20', () {

      double totalconta = 200;
      double taxa = 10;
      double comissao = 0;

      comissao = calcula_comissao(totalconta, taxa);
      expect(comissao, 20);
    });

    test('Testar cálculo da comissao == 25', () {

      double totalconta = 250;
      double taxa = 10;
      double comissao = 0;

      comissao = calcula_comissao(totalconta, taxa);
      expect(comissao, 25);
    });

    test('Testar cálculo da comissao == 50', () {

      double totalconta = 500;
      double taxa = 10;
      double comissao = 0;

      comissao = calcula_comissao(totalconta, taxa);
      expect(comissao, 50);
    });
  });

  group("Testes Negativos de Cálculos de comissão", () {

    test('Testar cálculo da comissao != 15', () {

      double totalconta = 160;
      double taxa = 10;
      double comissao = 0;

      comissao = calcula_comissao(totalconta, taxa);
      expect(comissao, isNot(15));
    });
  });
}