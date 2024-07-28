import 'products.dart';

class Measures {
  int id;
  String name;
  bool state;
  Product product;
  DateTime timeCreate;
  Measures(
      {required this.id,
      required this.name,
      required this.state,
      required this.product,
      required this.timeCreate});
}
