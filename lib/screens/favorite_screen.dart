// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shop/main.dart'; // Import main.dart if necessary for global access
import 'package:shop/models/product.dart'; // Import product.dart for Product model
import 'package:shop/screens/product_detail_screen.dart'; // Import ProductDetailScreen for navigation
import 'package:shop/constants/app_strings.dart'; // Import your constants file

// ignore: use_key_in_widget_constructors
class FavoriteScreen extends StatefulWidget {
  static List<Product> favoriteItems =
      []; // List to hold favorite items globally

  // Method to add a product to favorites
  static void addToFavorites(Product product) {
    favoriteItems.add(product);
  }

  // Method to remove a product from favorites
  static void removeFromFavorites(Product product) {
    favoriteItems.remove(product);
  }

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // Method to add all favorite items to cart
  void _addAllToCart() {
    MainScreen.cartItems.addAll(FavoriteScreen.favoriteItems); // Add to cart
    FavoriteScreen.favoriteItems
        .clear(); // Clear favorites after adding to cart
    setState(() {}); // Update UI after state change
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.favoriteItemsTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: FavoriteScreen.favoriteItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Gesture detector to navigate to product detail screen on tap
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                      product:
                                          FavoriteScreen.favoriteItems[index],
                                    ),
                                  ),
                                );
                              },
                              child: Image.asset(
                                FavoriteScreen.favoriteItems[index].image,
                                width: 70,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Product name
                                  Text(
                                    FavoriteScreen.favoriteItems[index].name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  // Quantity and price
                                  Text(
                                    '${FavoriteScreen.favoriteItems[index].quantity}, Price',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Product price
                                    Text(
                                      '\$${FavoriteScreen.favoriteItems[index].price.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    // Arrow icon indicating more details or action
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300], // Light color for the line
                        thickness: 1.0,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Button to add all favorite items to cart
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    FavoriteScreen.favoriteItems.isEmpty ? null : _addAllToCart,
                // ignore: sort_child_properties_last
                child: const Text(
                  AppStrings.addToCartAllTitle,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff8E97FD),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
