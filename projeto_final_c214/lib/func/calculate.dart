double calculaComissao(double totalconta, double taxa) {
  double comissao;

  comissao = (taxa * totalconta) / 100;

  return comissao;
}

double calculaTotal(double totalconta, int qtdPessoas, double comissao) {
  double totalpagar;

  totalpagar = (totalconta + comissao) / qtdPessoas;

  return double.parse(totalpagar.toStringAsFixed(2));
}
