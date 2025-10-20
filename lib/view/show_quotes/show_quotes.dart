import 'package:api_fetching_examples/controller/quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowQuotes extends StatelessWidget {
  const ShowQuotes({super.key});

  @override
  Widget build(BuildContext context) {
    final quotes = context.watch<QuotesController>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 20,
        onPressed: ()  {
           quotes.idq++;
          quotes.fetchdata();
        },
        child: Text("Next"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '" ${quotes.quoteconverted?["quote"] ?? "Quote"} "',

                style: TextStyle(
                  wordSpacing: 2,
                  letterSpacing: 2,
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "- ${quotes.quoteconverted?["author"] ?? "Author"}",
                style: TextStyle(
                  letterSpacing: 2,
                  color: Colors.blueGrey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
