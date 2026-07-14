import 'dart:ui';

import 'package:cafe_craze/MyText.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> item;

  const DetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff0c0f14),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            // Background Image
            Container(
              height: size.height * 0.65,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item['img']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Glassmorphism Overlay (Gradient at bottom of image)
            Positioned(
              top: size.height * 0.65 - size.height * 0.4, // Overlap gradient
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, const Color(0xff0c0f14)],
                    stops: const [0.0, 0.4],
                  ),
                ),
              ),
            ),

            // Main Content
            SafeArea(
              child: Column(
                children: [
                  // App Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xff0c0f14,
                              ).withValues(alpha: 0.4),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.1),
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xff0c0f14,
                            ).withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.1),
                            ),
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Color(0xffD17842),
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Scrollable Content (Card + Details)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Spacer to show background image
                          SizedBox(height: size.height * 0.35),

                          // Info Card
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 10,
                                  sigmaY: 10,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  color: Colors.black.withValues(alpha: 0.5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyText(
                                              text: item['title'],
                                              size: 24,
                                              fWeight: FontWeight.bold,
                                            ),
                                            const SizedBox(height: 5),
                                            MyText(
                                              text: item['extra'],
                                              size: 14,
                                              color: Colors.grey,
                                            ),
                                            const SizedBox(height: 15),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xffD17842),
                                                  size: 24,
                                                ),
                                                const SizedBox(width: 5),
                                                MyText(
                                                  text: "${item['rating']}",
                                                  size: 18,
                                                  fWeight: FontWeight.bold,
                                                ),
                                                const SizedBox(width: 5),
                                                MyText(
                                                  text: item['review'] ?? "()",
                                                  size: 14,
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              _buildFeatureBox(
                                                item['type'] == 'Coffee'
                                                    ? Icons.coffee
                                                    : Icons.whatshot,
                                                item['type'] == 'Coffee'
                                                    ? 'Coffee'
                                                    : 'Bean',
                                              ),
                                              const SizedBox(width: 15),
                                              _buildFeatureBox(
                                                item['type'] == 'Coffee'
                                                    ? Icons.water_drop
                                                    : Icons.location_on,
                                                item['type'] == 'Coffee'
                                                    ? 'Milk'
                                                    : 'Africa',
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xff141921),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: MyText(
                                              text:
                                                  item['roast'] ??
                                                  "Medium Roasted",
                                              size: 12,
                                              color: Colors.grey[400]!,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Details
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                MyText(
                                  text: "Description",
                                  size: 16,
                                  color: Colors.grey,
                                  fWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 10),
                                MyText(
                                  text: item['description'] ?? "",
                                  size: 14,
                                  color: Colors.grey[400]!,
                                  height: 1.5,
                                ),
                                const SizedBox(height: 20),
                                MyText(
                                  text: "Size",
                                  size: 16,
                                  color: Colors.grey,
                                  fWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildSizeButton(
                                      "S",
                                      item['type'] == 'Coffee',
                                    ),
                                    _buildSizeButton("M", false),
                                    _buildSizeButton("L", false),
                                  ],
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bottom Price & Cart (Fixed)
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyText(text: "Price", size: 14, color: Colors.grey),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "\$ ",
                                    style: TextStyle(
                                      color: Color(0xffD17842),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "${item['price']}0",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 60,
                          width: 240,
                          decoration: BoxDecoration(
                            color: const Color(0xffD17842),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: MyText(
                              text: "Add to Cart",
                              size: 18,
                              fWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureBox(IconData icon, String label) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: const Color(0xff141921),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xffD17842), size: 20),
          const SizedBox(height: 2),
          MyText(text: label, size: 10, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildSizeButton(String size, bool isSelected) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xff141921) : const Color(0xff0c0f14),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? const Color(0xffD17842) : Colors.grey[800]!,
        ),
      ),
      child: Center(
        child: MyText(
          text: size,
          size: 16,
          color: isSelected ? const Color(0xffD17842) : Colors.grey,
        ),
      ),
    );
  }
}
