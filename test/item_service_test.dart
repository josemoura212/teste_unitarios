import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:teste_unitarios/item.dart';
import 'package:teste_unitarios/item_repository.dart';
import 'package:teste_unitarios/item_service.dart';

// ! NÃO FAZER DESSA FORMA
// class ItemRepositoryFake implements IItemRepository {
//   @override
//   Item buscarProId(int id) {
//     return Item(name: "Item teste", preco: 10);
//   }

//   @override
//   Future<List<Item>> buscarTodos() async {
//     return <Item>[];
//   }

//   @override
//   List<Item> buscarTodosSync() {
//     return <Item>[];
//   }
// }

// class ItemRepositoryFakeException implements IItemRepository {
//   @override
//   Item buscarProId(int id) {
//     return Item(name: "Item teste", preco: 10);
//   }

//   @override
//   Future<List<Item>> buscarTodos() async {
//     throw Exception();
//   }

//   @override
//   List<Item> buscarTodosSync() {
//     return <Item>[];
//   }
// }

class ItemRepositoryFake extends Mock implements IItemRepository {}

void main() {
  late IItemRepository itemRepository;

  setUp(() {
    //preparaçao
    itemRepository = ItemRepositoryFake();
  });
  test('Buscar todos os item', () async {
    //preparaçao
    var service = ItemService(repository: itemRepository);
    when(() => itemRepository.buscarTodos()).thenAnswer((_) async => <Item>[]);
    //execuçao
    final item = await service.buscarTodos();

    //verificaçao
    expect(item, <Item>[]);
  });
  test('Buscar todos os item retorna uma exception', () async {
    //preparaçao
    var service = ItemService(repository: itemRepository);
    when(() => itemRepository.buscarTodos()).thenThrow(Exception());

    //execuçao
    final call = service.buscarTodos;

    //verificaçao
    expect(() => call(), throwsException);
  });

  test("Busca por id any", () {
    //preparaçao
    when(() => itemRepository.buscarProId(any()))
        .thenReturn(Item(name: "Item X", preco: 10));
    var service = ItemService(repository: itemRepository);
    //execuçao
    var item = service.buscarPorId(1455);

    //verificaçao
    verify(() => itemRepository.buscarProId(any())).called(1);
    expect(item, isNotNull);
  });
  test("Busca por id", () {
    //preparaçao
    when(() => itemRepository.buscarProId(1))
        .thenReturn(Item(name: "Item X", preco: 10));
    var service = ItemService(repository: itemRepository);
    //execuçao
    var item = service.buscarPorId(1);

    //verificaçao
    verify(() => itemRepository.buscarProId(1)).called(1);
    expect(item, isNotNull);
  });
}
