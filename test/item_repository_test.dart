import 'package:test/test.dart';
import 'package:teste_unitarios/item.dart';
import 'package:teste_unitarios/item_repository.dart';

void main() {
  test('Buscar todos asyncrono forma 1', () async {
    //preparaçao
    var repository = ItemRepository();
    //açao
    var items = await repository.buscarTodos();

    //execução
    expect(items, isNotEmpty);
  });
  test('Buscar todos asyncrono forma 2', () async {
    //preparaçao
    var repository = ItemRepository();
    //açao
    var buscarTodos = repository.buscarTodos;

    //execução
    expect(buscarTodos(), completion(isNotEmpty));
  });
  test('Buscar item por id', () async {
    //preparaçao
    var repository = ItemRepository();
    //açao
    var item = repository.buscarProId(1);

    //execução
    expect(
        item,
        allOf([
          isNotNull,
          equals(Item(name: "Iphone", preco: 10000.0)),
        ]));
  });
}
