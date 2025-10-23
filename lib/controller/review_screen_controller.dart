import 'dart:developer';

import 'package:api_fetching_examples/model/review_screen_model/review_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReviewScreenController with ChangeNotifier {
  ReviwFetching? maindata;
  int id = 0;
  Future<void> fetchReview() async {
    final url = Uri.parse("https://dummyjson.com/posts/$id");

    try {
      final reviewdata = await http.get(url);
      if (reviewdata.statusCode >= 200 && reviewdata.statusCode < 300) {
        maindata = reviwFetchingFromJson(reviewdata.body);
      } else {
        log(reviewdata.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
