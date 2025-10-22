import 'package:api_fetching_examples/model/product_model/Product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductController with ChangeNotifier {
  bool? isloading = false;
  ProductModel? product;

  Future<void> productFetch(int id) async {
    final url = Uri.parse("https://fakestoreapi.com/products/$id");

    try {
      final res = await http.get(url);
      if (res.statusCode >= 200 && res.statusCode < 300) {
        product = productModelFromJson(res.body);
      } else {
        debugPrint("error");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }
}
