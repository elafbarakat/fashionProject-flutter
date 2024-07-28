import 'dart:convert';
import '../models/category.dart' as c;
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../models/brand.dart';
import '../models/config.dart';
import '../models/products.dart';

class ProductProvider with ChangeNotifier {
  List<Product> products = [];

  List<Product> get getProducts {
    return products;
  }

  getProductsFN() async {
    String url = selectProudactPath;
    Uri urlPrese = Uri.parse(url);
    Map<String, String> data = {};

    var response = await http.post(urlPrese, body: data);
    var responseBody = await jsonDecode(response.body);

    if (responseBody['statu'] == 'success') {
      // print(responseBody['data'].length);
      for (var element in responseBody['data']) {
        products.add(
          Product(
            id: element['product_id'],
            title: {
              'ar': element['product_titleAr'],
              'en': element['product_titleEn'],
            },
            price: double.parse(element['product_price'].toString()),
            offer: double.parse(element['product_offer'].toString()),
            newP: element['product_newp'] == 0 ? false : true,
            category: c.Categories(
              id: element['product_categoryId'],
              brand: Brand(
                id: element['brand_id'],
                name: element['brand_name'],
                logo: element['brand_logo'],
                state: element['brand_state'] == 0 ? false : true,
                timeCreate: DateTime.parse(element['brand_timeCreate']),
              ),
              title: {
                'ar': element['category_titleAr'],
                'en': element['category_titleEn'],
              },
              image: element['category_image'],
              state: element['category_state'] == 0 ? false : true,
              timeCreate: DateTime.parse(element['category_timeCreate']),
            ),
            specifications: element['product_specifications'],
            imagePath: element['p_imagePath'],
            state: element['product_state'] == 0 ? false : true,
            timeCreate: DateTime.parse(element['product_timeCreate']),
          ),
        );
        //   products.add(productValueItem);
        // print(productValueItem.price);
      }
    }
    notifyListeners();
  }
}
