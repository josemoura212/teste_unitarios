import 'package:teste_unitarios/item.dart';

class Carrinho {
  List<Item> items;
  Carrinho({
    required this.items,
  });

  double totalCarrinho() {
    if (items.isEmpty) {
      throw CarrinhoException();
    }

    return items.fold(0, (total, item) => total += item.preco);
  }

  double totalCarrinhoComImposto() {
    var valorTotal = totalCarrinho();
    var imposto = 0.10;

    if (valorTotal < 5000) {
      return valorTotal;
    } else if (valorTotal > 20000) {
      imposto = 0.20;
    }
    valorTotal += (valorTotal * imposto);

    return valorTotal;
  }
}

class CarrinhoException implements Exception {}
