class Item {
  String name;
  double preco;
  Item({
    required this.name,
    required this.preco,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item && other.name == name && other.preco == preco;
  }

  @override
  int get hashCode => name.hashCode ^ preco.hashCode;
}
