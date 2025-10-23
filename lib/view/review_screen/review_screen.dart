import 'package:api_fetching_examples/controller/review_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewprovider = context.watch<ReviewScreenController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 30,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withValues(alpha: 0.7),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withValues(alpha: 0.3),
                    ),
                    child: Text(
                      'User ID : ${reviewprovider.maindata?.userId.toString() ?? " Id "}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                reviewprovider.maindata?.title ?? "Title",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //  Tags section using List.generate
              Row(
                children: List.generate(
                  reviewprovider.maindata?.tags?.length ?? 0,
                  (index) {
                    final tags = reviewprovider.maindata?.tags![index];
                    return Container(
                      margin: const EdgeInsets.only(
                        right: 16,
                      ), // spacing between tags
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black.withValues(alpha: 0.1),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Text(
                        '# $tags',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Text(
                reviewprovider.maindata?.body ?? "Description",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.thumb_up_alt_outlined),
                      SizedBox(width: 7),

                      Text(
                        reviewprovider.maindata?.reactions?.likes.toString() ??
                            "Like",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),

                  Row(
                    children: [
                      Icon(Icons.thumb_down_alt_outlined),
                      SizedBox(width: 7),

                      Text(
                        reviewprovider.maindata?.reactions?.dislikes
                                .toString() ??
                            "DIsLike",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),

                  Row(
                    children: [
                      Icon(Icons.visibility_outlined),
                      SizedBox(width: 7),

                      Text(
                        reviewprovider.maindata?.views.toString() ?? "Views",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          reviewprovider.id++;
                          context.read<ReviewScreenController>().fetchReview();
                        },
                        icon: Icon(Icons.label_important_outline),
                      ),
                      Text(
                        "Next",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
