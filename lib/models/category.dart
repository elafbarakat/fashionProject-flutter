import 'brand.dart';

class Categories {
  int id;
  Brand brand;
  Map title;
  String image;
  bool state;

  DateTime timeCreate;

  Categories({
    required this.id,
    required this.brand,
    required this.title,
    required this.image,
    required this.state,
    required this.timeCreate,
  });
}
