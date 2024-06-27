import 'package:flutter/material.dart';
import 'package:shop/main.dart'; // Import main.dart if necessary for global access
import '../models/product.dart'; // Import product.dart for Product model
import '../screens/product_detail_screen.dart'; // Import ProductDetailScreen for navigation

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
        title: Text(
          'Favorite Items',
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
                            SizedBox(width: 30),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Product name
                                  Text(
                                    FavoriteScreen.favoriteItems[index].name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  // Quantity and price
                                  Text(
                                    '${FavoriteScreen.favoriteItems[index].quantity}, Price',
                                    style: TextStyle(
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
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    // Arrow icon indicating more details or action
                                    Icon(
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
            SizedBox(height: 16),
            // Button to add all favorite items to cart
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    FavoriteScreen.favoriteItems.isEmpty ? null : _addAllToCart,
                child: Text('Add All To Cart',
                    style: TextStyle(
                      color: Colors.white,
                    )),
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
