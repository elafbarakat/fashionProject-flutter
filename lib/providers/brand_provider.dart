import 'dart:convert';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../models/brand.dart';
import '../models/config.dart';

class BrandProvider with ChangeNotifier {
  List<Brand> brands = [];

  List<Brand> get getBrands {
    return brands;
  }

  getBrandsFN() async {
    String url = insertBrandPath;
    Uri urlPrese = Uri.parse(url);
    var response = await http.post(urlPrese);
    var responseBody = await jsonDecode(response.body);
    if (responseBody['statu'] == 'success') {
      for (var element in responseBody['data']) {
        brands.add(
          Brand(
            id: element['brand_id'],
            name: element['brand_name'],
            logo: element['brand_logo'],
            state: element['brand_state'] == 0 ? false : true,
            timeCreate: DateTime.parse(element['brand_timeCreate']),
          ),
        );
      }
    }
    notifyListeners();
  }
}
