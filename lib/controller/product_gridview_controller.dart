import 'package:api_fetching_examples/model/product_gridview_model/product_gridview_model.dart';
import 'package:api_fetching_examples/model/product_model/Product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductGridviewController with ChangeNotifier {
  bool isloading = false;
  List<ProductGridModel> product = [];

  Future<void> productFetch() async {
    final url = Uri.parse("https://fakestoreapi.com/products/");

    try {
      isloading = true;
      notifyListeners();
      final res = await http.get(url);
      if (res.statusCode >= 200 && res.statusCode < 300) {
        product = productGridModelFromJson(res.body);
      } else {
        debugPrint("error");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    isloading = false;
    notifyListeners();
  }
}
