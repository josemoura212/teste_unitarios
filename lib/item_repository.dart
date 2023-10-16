import 'package:teste_unitarios/item.dart';

abstract class IItemRepository {
  Future<List<Item>> buscarTodos();

  List<Item> buscarTodosSync();

  Item buscarProId(int id);
}

class ItemRepository implements IItemRepository {
  @override
  Item buscarProId(int id) {
    return Item(name: "Iphone", preco: 10000.0);
  }

  @override
  Future<List<Item>> buscarTodos() async {
    final items = [
      Item(name: "Android", preco: 2000.0),
      Item(name: "Iphone 12", preco: 10000.0),
      Item(name: "Carregador de Tomada", preco: 200.0),
    ];

    await Future.delayed(Duration(seconds: 1));
    return items;
  }

  @override
  List<Item> buscarTodosSync() {
    final items = [
      Item(name: "Android", preco: 2000.0),
      Item(name: "Iphone 12", preco: 10000.0),
      Item(name: "Carregador de Tomada", preco: 200.0),
    ];

    return items;
  }
}
