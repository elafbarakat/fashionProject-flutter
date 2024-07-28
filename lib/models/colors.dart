import 'products.dart';

class Colors {
  int id;
  String name;
  bool state;
  Product product;
  DateTime timeCreate;

  Colors(
      {required this.id,
      required this.name,
      required this.state,
      required this.product,
      required this.timeCreate});
}
