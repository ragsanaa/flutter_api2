import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_api2/models/product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>?> getProductWithHttp() async {
  var uri = Uri.parse('https://fakestoreapi.com/products');
  var res = await http.get(uri);

  try {
    if (res.statusCode == 200) {
      var body = json.decode(res.body) as List;
      return body.map((e) => Product.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}

Future<List<Product>?> getProductWithDio() async {
  var url = 'https://fakestoreapi.com/products';
  var res = await Dio().get(url);

  try {
    if (res.statusCode == 200) {
      var body = res.data as List;
      return body.map((e) => Product.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}
