import 'package:test/test.dart';
import 'package:teste_unitarios/item_repository.dart';

void main() {
  test('Buscar todos asyncrono form 1', () async {
    //preparaçao
    var repository = ItemRepository();
    //açao
    var items = await repository.buscarTodos();

    //execução
    expect(items, isNotEmpty);
  });
  test('Buscar todos asyncrono form 2', () async {
    //preparaçao
    var repository = ItemRepository();
    //açao
    var buscarTodos = repository.buscarTodos;

    //execução
    expect(buscarTodos(), completion(isNotEmpty));
  });
}
