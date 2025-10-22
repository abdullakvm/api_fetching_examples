import 'package:api_fetching_examples/controller/product_controller.dart';
import 'package:api_fetching_examples/controller/quotes_controller.dart';
import 'package:api_fetching_examples/view/product_details/product-details.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const ProductDetails(),
      ),
    );
  }
}

