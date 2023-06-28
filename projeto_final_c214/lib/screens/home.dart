import 'package:flutter/material.dart';
import 'package:projeto_final_c214/widgets/widgetSlider.dart';

import '../widgets/widgetAppBar.dart';
import '../widgets/widgetButton.dart';

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

  //Criando a chave do form
  final _formkey = GlobalKey<FormState>();

  //Criando os TextControllers
  TextEditingController txtTotal = TextEditingController();
  TextEditingController txtQtd = TextEditingController();

  void calcularConta() {
    // 1 passo - Receber os valores
    setState(
      () {
        totalconta = double.parse(txtTotal.text);
        qntpessoas = int.parse(txtQtd.text);

        // 2 passo - Calcular a comissao do garçon
        comissao = (taxa * totalconta) / 100;

        // 3 passo - Calcular o total por pessoa
        totalpagar = (totalconta + comissao) / qntpessoas;

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
                  "TOTAL POR PESSOA: R\$ $totalpagar",
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
                  TextFormField(
                    controller: txtTotal,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      labelText: "Total da conta",
                    ),
                    style: const TextStyle(fontSize: 18),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Taxa de Serviços %: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
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
                    ],
                  ),
                  TextFormField(
                      controller: txtQtd,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        labelText: "Quantidade de Pessoas",
                      ),
                      style: const TextStyle(fontSize: 18),
                      validator: (valor) {
                        if (valor!.isEmpty) {
                          return "Campo obrigatório";
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  // SizedBox(
                  //   width: double.infinity,
                  //   height: 50,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       if (_formkey.currentState!.validate()) {
                  //         calcularConta();
                  //       }
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: const Color(0xffff6600),
                  //       foregroundColor: Colors.white,
                  //     ),
                  //     child: const Text(
                  //       "Calcular",
                  //       style: TextStyle(fontSize: 20),
                  //     ),
                  //   ),
                  // ),

                  Widgetbutton(onPressed: () {
                if (_formkey.currentState!.validate()) {
                  calcularConta();
                }
              }, label: "Calcular",)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
