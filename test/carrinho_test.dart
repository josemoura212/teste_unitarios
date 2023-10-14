import 'package:test/test.dart';
import 'package:teste_unitarios/carrinho.dart';
import 'package:teste_unitarios/item.dart';

void main() {
  group("Teste de caculo de valor total do carrinho", () {
    test("Deve calcular o valor total do carrinho", () {
      // Preparação
      final items = [
        Item(name: "Galaxy J1", preco: 2000.0),
        Item(name: "IPhone 12", preco: 10000.0),
        Item(name: "Carregador de tomada", preco: 200.0),
      ];

      final carrinho = Carrinho(items: items);
      // Ação ou  Execução
      var valorTotalDoCarrinho = carrinho.totalCarrinho();

      // Verificação

      expect(valorTotalDoCarrinho, 12200.0);
    });
    test("Deve calcular o valor total do carrinho para carrinho vazio", () {
      // Preparação
      final items = <Item>[];

      final carrinho = Carrinho(items: items);
      // Ação ou  Execução
      var valorTotalDoCarrinho = carrinho.totalCarrinho();

      // Verificação

      expect(valorTotalDoCarrinho, 0);
    });
  });

  group("Teste de calculo de valor total de carrinho com imposto", () {
    test("Deve calcular o valor total do carrinho com importo de 10%", () {
      //Preparação
      final items = [
        Item(name: "Galaxy J1", preco: 2000.0),
        Item(name: "IPhone 12", preco: 10000.0),
        Item(name: "Carregador de tomada", preco: 200.0),
      ];

      final carrinho = Carrinho(items: items);
      // Ação ou  Execução
      var valorTotalDoCarrinho = carrinho.totalCarrinhoComImposto();

      // Verificação

      expect(valorTotalDoCarrinho, 13420);
    });
    // Se o valor for menor que 5 mil não cobra imposto.
    test("Deve retornar o valor sem imposto caso seja menor que 5000", () {
      //Preparação
      final items = [
        Item(name: "Galaxy J1", preco: 2000.0),
        Item(name: "Fone de ouvido", preco: 2900.0),
      ];

      final carrinho = Carrinho(items: items);
      // Ação ou  Execução
      var valorTotalDoCarrinho = carrinho.totalCarrinhoComImposto();

      // Verificação

      expect(valorTotalDoCarrinho, 4900);
    });
    test("Deve retornar o valor com imposto caso seja igual a 5000", () {
      //Preparação
      final items = [
        Item(name: "Galaxy J1", preco: 2000.0),
        Item(name: "Fone de ouvido", preco: 3000.0),
      ];

      final carrinho = Carrinho(items: items);
      // Ação ou  Execução
      var valorTotalDoCarrinho = carrinho.totalCarrinhoComImposto();

      // Verificação

      expect(valorTotalDoCarrinho, 5500);
    });
    // Se o valor for maior que 20 mil entao cobra imposto de 20%.

    test("Deve retornar o valor com imposto de 20% caso seja maior que 20000",
        () {
      final items = [
        Item(name: "Galaxy J1", preco: 2000.0),
        Item(name: "Iphone", preco: 10000.0),
        Item(name: "Iphone", preco: 10000.0),
      ];

      final carrinho = Carrinho(items: items);
      // Ação ou  Execução
      var valorTotalDoCarrinho = carrinho.totalCarrinhoComImposto();

      // Verificação

      expect(valorTotalDoCarrinho, 26400);
    });
    test(
        "Deve retornar o valor com imposto de 10% para carrinho com vlaor igual a 20000",
        () {
      final items = [
        Item(name: "Iphone", preco: 10000.0),
        Item(name: "Iphone", preco: 10000.0),
      ];

      final carrinho = Carrinho(items: items);
      // Ação ou  Execução
      var valorTotalDoCarrinho = carrinho.totalCarrinhoComImposto();

      // Verificação

      expect(valorTotalDoCarrinho, 22000);
    });
  });

  group("Testede igualdade", () {
    test("Teste de igualdade 1", () {
      final iphone = Item(name: "Iphone", preco: 10000.0);
      final items = [
        Item(name: "Fone", preco: 10000.0),
        iphone,
        Item(name: "Teclado", preco: 10000.0),
      ];

      final carrinho = Carrinho(items: items);
      // Ação ou  Execução

      // Verificação

      expect(
          carrinho.items,
          contains(
            iphone,
          ));
    });
    test("Teste de igualdade 2", () {
      final items = [
        Item(name: "Fone", preco: 10000.0),
        Item(name: "Iphone", preco: 10000.0),
        Item(name: "Teclado", preco: 10000.0),
      ];

      final carrinho = Carrinho(items: items);
      // Ação ou  Execução

      // Verificação

      expect(
          carrinho.items,
          contains(
            Item(name: "Iphone", preco: 10000.0),
          ));
    });
    test("Teste de igualdade por tipo", () {
      final items = [
        Item(name: "Fone", preco: 10000.0),
        Item(name: "Iphone", preco: 10000.0),
        Item(name: "Teclado", preco: 10000.0),
      ];

      final carrinho = Carrinho(items: items);
      // Ação ou  Execução

      // Verificação

      expect(carrinho.items, isA<List<Item>>());
    });
    test("Teste de Exception", () {
      final items = <Item>[];

      final carrinho = Carrinho(items: items);
      var call = carrinho.totalCarrinho;
      // Ação ou  Execução

      // Verificação

      expect(
        () => call(),
        throwsException,
      );
    });
    test("Teste de Exception customizada", () {
      final items = <Item>[];

      final carrinho = Carrinho(items: items);
      var call = carrinho.totalCarrinho;
      // Ação ou  Execução

      // Verificação

      expect(
        () => call(),
        throwsA(isA<CarrinhoException>()),
      );
    });
    test("Teste de Exception customizada 2", () {
      final items = <Item>[];

      final carrinho = Carrinho(items: items);
      // Ação ou  Execução

      try {
        carrinho.totalCarrinho();
      } on CarrinhoException {
        print("Sucesso");
      } catch (e) {
        fail("Retornou outra exception $e");
      }
      // Verificação

      // expect(
      //   () => call(),
      //   throwsA(isA<CarrinhoException>()),
      // );
    });
  });
}
