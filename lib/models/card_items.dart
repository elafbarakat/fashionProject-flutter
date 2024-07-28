import 'products.dart';
import 'user.dart';

class CardItems {
  int id;
  User user;
  Product product;
  bool state;
  DateTime timeCreate;

  CardItems(
      {required this.id,
      required this.user,
      required this.product,
      required this.state,
      required this.timeCreate});
}
