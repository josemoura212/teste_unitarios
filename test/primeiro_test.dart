import 'package:test/test.dart';

void main() {
  test("Teste sem grupo", () {});
  group('Grupo de teste', () {
    test('Teste dentro do grupo 1', () {
      // throw Exception();
    });
    test('Teste dentro do grupo 2', () {});
    test('Teste dentro do grupo 3', () {});
    test('Teste dentro do grupo 4', () {});
  });
}
