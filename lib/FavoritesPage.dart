import 'dart:ui';
import 'package:cafe_craze/MyText.dart';
import 'package:cafe_craze/data/favorites_data.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0c0f14),
        body: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xff141921),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.grid_view_rounded,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                  MyText(text: "Favorites", size: 24, fWeight: FontWeight.bold),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/profile_img.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Favorites List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: favoriteItems.length,
                itemBuilder: (context, index) {
                  return FavoriteItemCard(item: favoriteItems[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const FavoriteItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xff141921),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image + Overlay Section
          SizedBox(
            height: 400, // Fixed height for image area as per design aspect
            child: Stack(
              children: [
                // Background Image
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(25),
                      bottom: Radius.circular(25),
                    ),
                    child: Image.asset(item['image'], fit: BoxFit.cover),
                  ),
                ),

                // Top Right Heart Icon
                Positioned(
                  top: 25,
                  right: 25,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xff0c0f14).withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Color(0xffD17842),
                      size: 20,
                    ),
                  ),
                ),

                // Glassmorph Overlay
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(25),
                      top: Radius.circular(25),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.black.withValues(alpha: 0.5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: item['title'],
                                    size: 20,
                                    fWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(height: 5),
                                  MyText(
                                    text: item['subtitle'],
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star_rounded,
                                        color: Color(0xffD17842),
                                        size: 22,
                                      ),
                                      const SizedBox(width: 5),
                                      MyText(
                                        text: "${item['rating']}",
                                        size: 16,
                                        fWeight: FontWeight.bold,
                                      ),
                                      const SizedBox(width: 5),
                                      MyText(
                                        text: item['reviews'],
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Right Side Features
                            Column(
                              children: [
                                Row(
                                  children: [
                                    _buildFeatureBox(
                                      item['type'] == 'Coffee'
                                          ? Icons.coffee
                                          : Icons.whatshot,
                                      item['type'] == 'Coffee'
                                          ? "Coffee"
                                          : "Bean",
                                    ),
                                    const SizedBox(width: 15),
                                    _buildFeatureBox(
                                      item['type'] == 'Coffee'
                                          ? Icons.water_drop
                                          : Icons.location_on,
                                      item['type'] == 'Coffee'
                                          ? "Milk"
                                          : "Africa",
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff141921),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: MyText(
                                    text: item['roast'],
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
              ],
            ),
          ),

          // Description Section
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Description",
                  size: 16,
                  color: Colors.grey,
                  fWeight: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                MyText(
                  text: item['description'],
                  size: 14,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureBox(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xff141921),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xffD17842), size: 20),
          const SizedBox(height: 4),
          MyText(text: label, size: 10, color: Colors.grey),
        ],
      ),
    );
  }
}
