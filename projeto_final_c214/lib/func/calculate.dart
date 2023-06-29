

double calcula_comissao(double totalconta, double taxa){

  double comissao;

  comissao = (taxa * totalconta) / 100;

  return comissao;
}

double calcula_total(double totalconta, int qtd_pessoas, double comissao){

  double totalpagar;

  totalpagar = (totalconta + comissao) / qtd_pessoas;

  return totalpagar;
}