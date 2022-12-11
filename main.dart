//EQUIPE: Gustavo Sousa Castro e Matheus Rodrigues de Oliveira Solon
import 'dart:io';

void main() {
  var lista = [];
  var indice;
  var rep = true;
  var lista_final = [];

  do {
    print("Digite um número: ");
    final input = stdin.readLineSync();
    lista.add(int.parse("${input}"));
    indice = lista.length - 1;
    comparar_fr(lista, indice);
    print("Digite [S] caso deseje colocar outro número, [N] para ordenar.");
    final resp = stdin.readLineSync();
    if (resp == "N" || resp == "n") {
      rep = false;
    }
  } while (rep);
  print("Lista não ordenada: ${lista}");

  do {
    var tamanho = lista.length - 1;
    lista_final.add(trocar_valores(lista));
    lista = lista.sublist(0, tamanho);
    comparar_rf(lista, 0);
  } while (lista.length > 0);
  print("Lista ordenada: ${lista_final}");
}

void comparar_rf(var lista, var indice_raiz) {
  var temp;
  if (lista.length - 1 > 1) {
    var indice_direito = (2 * indice_raiz) + 1;
    var indice_esquerdo = (2 * indice_raiz) + 2;
    if (indice_direito <= (lista.length - 1) &&
        indice_esquerdo <= (lista.length - 1)) {
      if (lista[indice_direito] < lista[indice_esquerdo]) {
        if (lista[indice_raiz] > lista[indice_direito]) {
          temp = lista[indice_raiz];
          lista[indice_raiz] = lista[indice_direito];
          lista[indice_direito] = temp;
          comparar_rf(lista, indice_direito);
        }
      } else {
        if (indice_esquerdo <= (lista.length - 1)) {
          if (lista[indice_raiz] > lista[indice_esquerdo]) {
            temp = lista[indice_raiz];
            lista[indice_raiz] = lista[indice_esquerdo];
            lista[indice_esquerdo] = temp;
            comparar_rf(lista, indice_esquerdo);
          }
        }
      }
    } else if (indice_direito <= (lista.length - 1)) {
      if (lista[indice_raiz] > lista[indice_direito]) {
        temp = lista[indice_raiz];
        lista[indice_raiz] = lista[indice_direito];
        lista[indice_direito] = temp;
        comparar_rf(lista, indice_direito);
      }
    }
  }
}

void comparar_fr(var lista, var index) {
  var temp;
  if (lista.length > 1) {
    double indice_raiz = (index - 1) / 2;
    if (lista[index] < lista[indice_raiz.floor()]) {
      temp = lista[indice_raiz.floor()];
      lista[indice_raiz.floor()] = lista[index];
      lista[index] = temp;
      if (indice_raiz.floor() > 0) {
        comparar_fr(lista, indice_raiz.floor());
      }
    }
  }
}

int trocar_valores(var lista) {
  var raiz = lista[0];
  lista[0] = lista[lista.length - 1];
  return raiz;
}
