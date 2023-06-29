import 'package:flutter/material.dart';

import '../func/calculate.dart';
import '../widgets/widgetAppBar.dart';
import '../widgets/widgetButton.dart';
import '../widgets/widgetSlider.dart';
import '../widgets/widgetTextFormField.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Variaveis
  double taxa = 0;
  double totalconta = 0, totalpagar = 0, comissao = 0;
  int qntpessoas = 0;
  double total = 0;
  //Calculate calc = new Calculate();

  //Criando a chave do form
  final _formkey = GlobalKey<FormState>();

  //Criando os TextControllers
  TextEditingController txtTotal = TextEditingController();
  TextEditingController txtQtd = TextEditingController();

  void calcularConta() {
    setState(
          () {
        totalconta = double.parse(txtTotal.text);
        qntpessoas = int.parse(txtQtd.text);

        comissao = calcula_comissao(totalconta, taxa);

        total = calcula_total(totalconta, qntpessoas, comissao);

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Total a pagar por pessoa"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/smile.png",
                  width: 60,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "O TOTAL DA CONTA: R\$ $totalconta",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "TAXA DO GARÇOM: R\$ $comissao",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "TOTAL POR PESSOA: R\$ $total",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffff6600),
                    foregroundColor: Colors.white),
                child: const Text("OK!"),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: wAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 40, left: 130, right: 130),
                    child: Image.asset("assets/icon_money.png"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  WidgetTextFormField(
                    controller: txtTotal,
                    labelText: 'Total da conta',
                    validator: (valor) {
                      if (valor!.isEmpty) {
                        return "Campo obrigatório";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  WidgetSlider(
                    value: taxa,
                    min: 0,
                    max: 10,
                    labelText: 'Taxa de serviço %',
                    label: 'Taxa',
                    divisions: 10,
                    onChanged: (double valor) {
                      setState(
                            () {
                          taxa = valor;
                        },
                      );
                    },
                  ),
                  WidgetTextFormField(
                    controller: txtQtd,
                    labelText: 'Quantidade de pessoas',
                    validator: (valor) {
                      if (valor!.isEmpty) {
                        return "Campo obrigatório";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Widgetbutton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        calcularConta();
                      }
                    },
                    label: "Calcular",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
