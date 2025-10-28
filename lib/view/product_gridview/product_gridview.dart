import 'package:api_fetching_examples/controller/product_gridview_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGridview extends StatefulWidget {
  const ProductGridview({super.key});

  @override
  State<ProductGridview> createState() => _ProductGridviewState();
}

class _ProductGridviewState extends State<ProductGridview> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<ProductGridviewController>().productFetch();
    }); // for state change after the ui build
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productres = context.watch<ProductGridviewController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Products",
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: productres.isloading
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                itemCount: productres.product.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10, // Horizontal space
                  mainAxisSpacing: 10, // Vertical space
                  childAspectRatio: 3 / 4, // Width : Height ratio
                ),
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Image.network(
                        productres.product[index].image ??
                            "https://images.pexels.com/photos/3905776/pexels-photo-3905776.jpeg",
                        fit: BoxFit.fitWidth,
                        height: 100,
                      ),
                      Text(
                        productres.product[index].title ?? "Title",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        productres.product[index].description ?? "Description",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$ ${productres.product[index].price.toString()}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 3, 79, 42),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            productres.product[index].category?.toUpperCase() ??
                                " MensCloathing ",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "⭐ ${productres.product[index].rating?.rate ?? ""}",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
