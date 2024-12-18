import 'package:vania/vania.dart';

class Product extends Model {
  @override
  String get latihan_vania => 'products'; // Nama tabel di database

  int? id;
  String? name;
  String? description;
  double? price;

  Product();

  Product.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    price = double.parse(map['price'].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }
}
