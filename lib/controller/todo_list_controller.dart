import 'package:api_fetching_examples/model/todo_model/todo_list_res_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoListController with ChangeNotifier {
  bool isLoading = false;
  List<Todo> listtodo = [];
  Future<void> todoFetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://dummyjson.com/todos");
    try {
      final res = await http.get(url);
      if (res.statusCode >= 200 && res.statusCode < 300) {
        TodoListResModel todoListResModel = todoListResModelFromJson(res.body);
        listtodo = todoListResModel.todos ?? [];
      } else {
        debugPrint(res.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }
}
