import 'products.dart';

class Clothes {
  //الاقمشة
  int id;
  String name;
  bool state;
  Product product;
  DateTime timeCreate;

  Clothes(
      {required this.id,
      required this.name,
      required this.state,
      required this.product,
      required this.timeCreate});
}
