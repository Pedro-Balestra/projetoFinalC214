import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_final_c214/func/calculate.dart';

void main() {
  group("Testes de Cálculos de comissão", () {
    test('Testar cálculo da comissao == 15', () {
      double totalconta = 150;
      double taxa = 10;
      double comissao = 0;

      comissao = calculaComissao(totalconta, taxa);
      expect(comissao, 15);
    });

    test('Testar cálculo da comissao == 10', () {
      double totalconta = 100;
      double taxa = 10;
      double comissao = 0;

      comissao = calculaComissao(totalconta, taxa);
      expect(comissao, 10);
    });

    test('Testar cálculo da comissao == 20', () {
      double totalconta = 200;
      double taxa = 10;
      double comissao = 0;

      comissao = calculaComissao(totalconta, taxa);
      expect(comissao, 20);
    });

    test('Testar cálculo da comissao == 25', () {
      double totalconta = 250;
      double taxa = 10;
      double comissao = 0;

      comissao = calculaComissao(totalconta, taxa);
      expect(comissao, 25);
    });

    test('Testar cálculo da comissao == 50', () {
      double totalconta = 500;
      double taxa = 10;
      double comissao = 0;

      comissao = calculaComissao(totalconta, taxa);
      expect(comissao, 50);
    });
  });

  group("Testes Negativos de Cálculos de comissão", () {
    test('Testar cálculo da comissao != 15', () {
      double totalconta = 160;
      double taxa = 10;
      double comissao = 0;

      comissao = calculaComissao(totalconta, taxa);
      expect(comissao, isNot(15));
    });

    test('Testar cálculo da comissao != 60', () {
      double totalconta = 1250;
      double taxa = 5;
      double comissao = 0;

      comissao = calculaComissao(totalconta, taxa);
      expect(comissao, isNot(60));
    });

    test('Testar cálculo da comissao != 90', () {
      double totalconta = 85;
      double taxa = 2;
      double comissao = 0;

      comissao = calculaComissao(totalconta, taxa);
      expect(comissao, isNot(90));
    });

    test('Testar cálculo da comissao != 132', () {
      double totalconta = 132;
      double taxa = 7;
      double comissao = 0;

      comissao = calculaComissao(totalconta, taxa);
      expect(comissao, isNot(132));
    });

    test('Testar cálculo da comissao != 190', () {
      double totalconta = 69;
      double taxa = 6;
      double comissao = 0;

      comissao = calculaComissao(totalconta, taxa);
      expect(comissao, isNot(190));
    });
  });

  group("Testes de Cálculos de valor total a pagar por pessoa", () {
    test('Testar cálculo do valor a pagar por pessoa == 55', () {
      double totalconta = 150;
      int qtdPessoas = 3;
      double taxa = 10;
      double totalPagar = 0;

      totalPagar = calculaTotal(
          totalconta, qtdPessoas, calculaComissao(totalconta, taxa));
      expect(totalPagar, 55);
    });
    test('Testar cálculo do valor a pagar por pessoa == 87.5', () {
      double totalconta = 500;
      int qtdPessoas = 6;
      double taxa = 5;
      double totalPagar = 0;

      totalPagar = calculaTotal(
          totalconta, qtdPessoas, calculaComissao(totalconta, taxa));
      expect(totalPagar, 87.5);
    });
    test('Testar cálculo do valor a pagar por pessoa == 275', () {
      double totalconta = 2500;
      int qtdPessoas = 10;
      double taxa = 10;
      double totalPagar = 0;

      totalPagar = calculaTotal(
          totalconta, qtdPessoas, calculaComissao(totalconta, taxa));
      expect(totalPagar, 275);
    });
    test('Testar cálculo do valor a pagar por pessoa == 5.5', () {
      double totalconta = 50;
      int qtdPessoas = 10;
      double taxa = 10;
      double totalPagar = 0;

      totalPagar = calculaTotal(
          totalconta, qtdPessoas, calculaComissao(totalconta, taxa));
      expect(totalPagar, 5.5);
    });
    test('Testar cálculo do valor a pagar por pessoa == 71.43', () {
      double totalconta = 500;
      int qtdPessoas = 7;
      double taxa = 0;
      double totalPagar = 0;

      totalPagar = calculaTotal(
          totalconta, qtdPessoas, calculaComissao(totalconta, taxa));
      expect(totalPagar, 71.43);
    });
  });

  group("Testes Negativos de Cálculos de valor total a pagar por pessoa", () {
    test('Testar cálculo do valor a pagar por pessoa != 100', () {
      double totalconta = 165;
      int qtdPessoas = 2;
      double taxa = 10;
      double totalPagar = 0;

      totalPagar = calculaTotal(
          totalconta, qtdPessoas, calculaComissao(totalconta, taxa));
      expect(totalPagar, isNot(100));
    });
    test('Testar cálculo do valor a pagar por pessoa != 50', () {
      double totalconta = 180;
      int qtdPessoas = 6;
      double taxa = 6;
      double totalPagar = 0;

      totalPagar = calculaTotal(
          totalconta, qtdPessoas, calculaComissao(totalconta, taxa));
      expect(totalPagar, 50);
    });
    test('Testar cálculo do valor a pagar por pessoa != 30', () {
      double totalconta = 1230;
      int qtdPessoas = 5;
      double taxa = 10;
      double totalPagar = 0;

      totalPagar = calculaTotal(
          totalconta, qtdPessoas, calculaComissao(totalconta, taxa));
      expect(totalPagar, 30);
    });
    test('Testar cálculo do valor a pagar por pessoa != 62,3', () {
      double totalconta = 238;
      int qtdPessoas = 3;
      double taxa = 10;
      double totalPagar = 0;

      totalPagar = calculaTotal(
          totalconta, qtdPessoas, calculaComissao(totalconta, taxa));
      expect(totalPagar, 62.3);
    });
    test('Testar cálculo do valor a pagar por pessoa != 26.58', () {
      double totalconta = 620;
      int qtdPessoas = 7;
      double taxa = 0;
      double totalPagar = 0;

      totalPagar = calculaTotal(
          totalconta, qtdPessoas, calculaComissao(totalconta, taxa));
      expect(totalPagar, 26.58);
    });
  });
}
