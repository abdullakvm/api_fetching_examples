import 'package:api_fetching_examples/controller/product_controller.dart';
import 'package:api_fetching_examples/controller/product_gridview_controller.dart';
import 'package:api_fetching_examples/controller/quotes_controller.dart';
import 'package:api_fetching_examples/controller/review_screen_controller.dart';
import 'package:api_fetching_examples/controller/todo_list_controller.dart';
import 'package:api_fetching_examples/view/product_gridview/product_gridview.dart';
import 'package:api_fetching_examples/view/todo_screen/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuotesController(),),
        ChangeNotifierProvider(create: (context) => ProductController(),),
        ChangeNotifierProvider(create: (context) => ReviewScreenController(),),
        ChangeNotifierProvider(create: (context) => TodoListController(),),
        ChangeNotifierProvider(create: (context) => ProductGridviewController(),),
        

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  ProductGridview(),
      ),
    );
  }
}

