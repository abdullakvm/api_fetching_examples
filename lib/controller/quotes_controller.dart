import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class QuotesController with ChangeNotifier {
  Map? quoteconverted;
  bool isLoading = false;
  int idq =
      0; // set id as o at start then increase by one when next button clicks
  Future<void> fetchdata() async {
    final url = Uri.parse("https://dummyjson.com/quotes/$idq");

    try {
      isLoading = true;
      notifyListeners();
      final qoutedata = await http.get(url);
      if (qoutedata.statusCode >= 200 && qoutedata.statusCode < 300) {
        quoteconverted = jsonDecode(qoutedata.body);
        notifyListeners();
      } else {
        log("problem is ${qoutedata.statusCode.toString()}");
      }
    } catch (e) {
      log(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }
}
