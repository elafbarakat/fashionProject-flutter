import 'products.dart';

class Videos {
  String productImage;
  Product product; //رقم المنتج
  bool state;
  DateTime timeCreate;

  Videos(
      {required this.productImage,
      required this.product,
      required this.state,
      required this.timeCreate});
}
