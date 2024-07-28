import 'category.dart';

class Product {
  int id;
  Map title;
  double price;
  double offer; // عرض على قطعة معينة
  bool newP; //منتج جديد
  Categories category;
  String specifications; // مواصفات المنتج
  String imagePath; //  صورة المنتج
  bool state;
  DateTime timeCreate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.offer,
    required this.newP,
    required this.category,
    required this.specifications,
    required this.imagePath,
    required this.state,
    required this.timeCreate,
  });
}
