import 'products.dart';
import 'user.dart';

class Favorite {
  int id;
  Product product;
  User user;
  bool state;
  Favorite({
    required this.id,
    required this.product,
    required this.user,
    required this.state,
  });
}
