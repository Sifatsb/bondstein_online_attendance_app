class Store {
  final int id;
  final String name;
  final String address;

  Store(this.id, this.name, this.address);

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      json['id'],
      json['name'],
      json['address'],
    );
  }
}
