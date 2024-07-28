import 'dart:convert';
//import 'package:fashionProject/models/user.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../models/config.dart';
import '../models/user.dart';

//import 'package:dio/dio.dart';

class UserProvider with ChangeNotifier {
  List<User> users = [];

  List<User> get getUsers {
    return users;
  }

  Future<bool> getLoginFN(
      {required String email, required String password}) async {
    bool returnVal = false;
    String url = selectUserPath; ////
    Uri urlPrese = Uri.parse(url);
    Map<String, String> data = {
      'user_email': email,
      'user_password': password,
    };
    var response = await http.post(urlPrese, body: data);
    var responseBody = await jsonDecode(response.body);

    if (responseBody['statu'] == 'success') {
      returnVal = true;
    }
    notifyListeners();
    return returnVal;
  }

  Future<bool> getSignupFN(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    bool returnVal = false;
    String url = insertUserPath;

    ///
    Uri urlPrese = Uri.parse(url);
    Map<String, String> data = {
      'user_name': name,
      'user_email': email,
      'user_phone': phone,
      'user_password': password,
    };
    var response = await http.post(urlPrese, body: data);
    var responseBody = await jsonDecode(response.body);

    if (responseBody['statu'] == 'success') {
      // print('success');
      returnVal = true;
    }
    // else {
    //   print('faild');
    // }
    notifyListeners();
    return returnVal;
  }

  Future getUsersFN({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    String url = insertUserPath;
    Uri urlPrese = Uri.parse(url);
    Map<String, String> data = {
      'user_name': name,
      'user_email': email,
      'user_phone': phone,
      'user_password': password,
    };
    var response = await http.post(urlPrese, body: data);
    var responseBody = await jsonDecode(response.body);

    if (responseBody['statu'] == 'success') {
      print('success');
    } else {
      print('faild');
    }
    notifyListeners();
  }
}
