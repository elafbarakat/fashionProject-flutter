import 'products.dart';

class TypeClothes {
  int id;
  String name;
  bool state;
  Product product;
  DateTime timeCreate;

  TypeClothes(
      {required this.id,
      required this.name,
      required this.state,
      required this.product,
      required this.timeCreate});
}
