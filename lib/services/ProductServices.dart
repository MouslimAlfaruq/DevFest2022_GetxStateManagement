// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:state_managment_with_getx/app/AppConst.dart';

class ProductsService {
  static var client = http.Client();
  static fetchProducts() async {
    var path = '/products';
    var endpoint = '${AppConst.baseUrl}$path';
    var uri = Uri.parse(endpoint);
    var response = await client.get(uri);
    var results = jsonDecode(response.body);
    // print(results);
    if (response.statusCode == 200) {
      // Code for success
      return results;
    } else {
      return null;
    }
  }
}
