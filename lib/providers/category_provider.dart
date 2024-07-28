import 'dart:convert';
//import 'package:fashionProject/models/category.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../models/brand.dart';
import '../models/category.dart';
import '../models/config.dart';

class CategoryProvider with ChangeNotifier {
  List<Categories> categorys = [];

  List<Categories> get getCategorys {
    return categorys;
  }

  // ignore: non_constant_identifier_names
  getCategoryFN({required int brana_id}) async {
    categorys.clear();
    // notifyListeners();
    String url = selectCategoryPath;
    Uri urlPrese = Uri.parse(url);
    Map<String, String> data = {'brand_id': brana_id.toString()};
    var response = await http.post(urlPrese, body: data);
    var responseBody = await jsonDecode(response.body);

    if (responseBody['statu'] == 'success') {
      // responseBody['data'].lengh;
      for (var element in responseBody['data']) {
        categorys.add(
          Categories(
            id: element['category_id'],
            brand: Brand(
              id: element['brand_id'],
              name: element['brand_name'],
              logo: element['brand_logo'],
              state: element['brand_state'] == 0 ? false : true,
              timeCreate: DateTime.parse(element['brand_timeCreate']),
            ),
            title: {
              'ar': element['category_nameAr'],
              'en': element['category_nameEn'],
            },
            image: element['category_image'],
            state: element['category_state'] == 0 ? false : true,
            timeCreate: DateTime.parse(element['category_timeCreate']),
          ),
        );
      }
    }
    notifyListeners();
  }

  // getCategoryFN() async {
  //   print("object");
  //   var formData = FormData.fromMap({});
  //   var response = await Dio().post(
  //       'http://192.168.1.105/Fathion/Category/selectCategory.php',
  //       data: formData);
  //   if (response.statusCode == 200) {
  //     print('Operation uploaded - server response: ${response.statusCode}');
  //     print(response);
  //   } else {
  //     print('Operation not uploaded - server response: ${response.statusCode}');
  //   }
  // }
}
