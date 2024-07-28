import 'dart:convert';
//import 'package:fashionProject/models/products.dart';
//import 'package:fashionProject/models/user.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http; //
import '../models/category.dart' as c;
//import 'package:fashionProject/models/favorite.dart';
import 'package:flutter/material.dart';
import '../models/config.dart';
import '../models/favorite.dart';
import '../models/products.dart';
import '../models/user.dart';

class FavoriteProvider with ChangeNotifier {
  List<Favorite> favorite = [];

  List<Favorite> get getFavorites {
    return favorite; //// ?
  }

  getFavoriteFN() async {
    String url = selecFavoritePath;
    Uri urlPrese = Uri.parse(url);
    Map<String, String> data = {};
    var response = await http.post(urlPrese, body: data);
    var responseBody = await jsonDecode(response.body);

    if (responseBody['statu'] == 'success') {
      for (var element in responseBody['data']) {
        favorite.add(Favorite(
          id: element['favorite_id'],
          product: Product(
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
              brand: element['brand_id'],
              title: {
                'ar': element['category_titleAr'],
                'en': element['category_titleEn'],
              },
              image: element['category_image'],
              state: element['category_state'] == 0 ? false : true,
              timeCreate: DateTime.parse(element['category_timeCreate']),
            ),
            specifications: element['product_specifications'],
            imagePath: element['product_imagePath'],
            state: element['product_state'] == 0 ? false : true,
            timeCreate: DateTime.parse(element['product_timeCreate']),
          ),
          user: User(
            id: element['user_id'],
            name: element['user_name'],
            email: element['user_email'],
            phone: element['user_phone'],
            password: element['user_password'],
            state: element['user_state'] == 0 ? false : true,
            timeCreate: DateTime.parse(element['user_timeCreate']),
          ),
          state: element['favorite_state'] == 0 ? false : true,
        ));
      }
    }
    notifyListeners();
  }
}
