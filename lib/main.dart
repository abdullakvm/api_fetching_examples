import 'package:api_fetching_examples/controller/quotes_controller.dart';
import 'package:api_fetching_examples/view/show_quotes/show_quotes.dart';
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
        ChangeNotifierProvider(create: (context) => QuotesController(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const ShowQuotes(),
      ),
    );
  }
}

