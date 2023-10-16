import 'package:teste_unitarios/item_repository.dart';

import 'item.dart';

class ItemService {
  IItemRepository repository;
  ItemService({
    required this.repository,
  });

  Future<List<Item>> buscarTodos() => repository.buscarTodos();
  List<Item> buscarTodosSync() => repository.buscarTodosSync();
  Item buscarPorId(int id) => repository.buscarProId(id);
}
