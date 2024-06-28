// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:shop/main.dart'; // Assuming this contains MainScreen
import 'package:shop/models/product.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/widgets/product_card.dart';
import '../constants/app_strings.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Organic Bananas',
      quantity: '1kg',
      price: 4.99,
      description: 'Fresh organic bananas.',
      image: 'assets/product_images/bananas.png',
    ),
    Product(
      name: 'Red Apple',
      quantity: '1kg',
      price: 4.99,
      description: 'Crispy red apples.',
      image: 'assets/product_images/red_apple.png',
    ),
    Product(
      name: 'Bell Pepper Red',
      quantity: '1kg',
      price: 4.99,
      description: 'Fresh bell peppers.',
      image: 'assets/product_images/bell_papper_red.png',
    ),
    Product(
      name: 'Ginger',
      quantity: '250g',
      price: 4.99,
      description: 'Fresh ginger.',
      image: 'assets/product_images/ginger.png',
    ),
  ];

  final List<Product> bestSellingProducts = [
    Product(
      name: 'Bell Pepper Red',
      quantity: '1kg',
      price: 4.99,
      description: 'Fresh bell peppers.',
      image: 'assets/product_images/bell_papper_red.png',
    ),
    Product(
      name: 'Ginger',
      quantity: '250g',
      price: 4.99,
      description: 'Fresh ginger.',
      image: 'assets/product_images/ginger.png',
    ),
  ];

  final List<Product> groceries = [
    Product(
      name: 'Pulses',
      quantity: '1kg',
      price: 4.99,
      description: 'Fresh pulses.',
      image: 'assets/groceries_images/pulses.png',
      backgroundColor: const Color(0xffF8A44C).withOpacity(0.2),
    ),
    Product(
      name: 'Rice',
      quantity: '1kg',
      price: 4.99,
      description: 'Fresh rice.',
      image: 'assets/groceries_images/rice.png',
      backgroundColor: const Color(0xff8E97FD).withOpacity(0.2),
    ),
  ];

  final List<Product> moreProducts = [
    Product(
      name: 'Beef Bone',
      quantity: '1kg',
      price: 4.99,
      description: 'Fresh beef bone.',
      image: 'assets/product_images/beef_bone.png',
    ),
    Product(
      name: 'Broiler Chicken',
      quantity: '1kg',
      price: 4.99,
      description: 'Fresh broiler chicken.',
      image: 'assets/product_images/broiler_chicken.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Image
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 245, 244, 242),
                image: DecorationImage(
                  image: AssetImage('assets/product_images/banner.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Exclusive Offer Section
            buildSection(AppStrings.productDetailToggleText,
                () => buildProductList(products)),
            const SizedBox(height: 16),

            // Best Selling Section
            buildSection(AppStrings.bestSellingTitle,
                () => buildProductList(bestSellingProducts)),
            const SizedBox(height: 16),

            // Groceries Section
            buildGroceriesSection(),
            const SizedBox(height: 16),

            // More Products List
            buildProductList(moreProducts),
          ],
        ),
      ),
    );
  }

  // Function to build a section with a title and content
  Widget buildSection(String title, Widget Function() buildContent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title, onSeeAll: () => handleSeeAllTap(title)),
        const SizedBox(height: 8),
        buildContent(),
      ],
    );
  }

  // Function to build the list of products
  Widget buildProductList(List<Product> productList) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return buildProductCard(context, productList[index]);
        },
      ),
    );
  }

  // Function to build a product card widget
  Widget buildProductCard(BuildContext context, Product product) {
    return SizedBox(
      width: 150,
      child: ProductCard(
        product: product,
        onTap: () => navigateToProductDetail(context, product),
        onAddToCart: MainScreen.addToCart, // Assuming addToCart is static
      ),
    );
  }

  // Function to build the groceries section content
  Widget buildGroceriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppStrings.categoriesTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => handleSeeAllTap(AppStrings.categoriesTitle),
                child: const Text(
                  AppStrings.seeAllText,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: groceries.length,
            itemBuilder: (context, index) {
              return buildGroceryItem(groceries[index]);
            },
          ),
        ),
      ],
    );
  }

  // Function to build a grocery item widget
  Widget buildGroceryItem(Product product) {
    return Container(
      width: 220, // Increase width slightly for a more rectangular appearance
      height: 80, // Adjust height for a more compact layout
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: product.backgroundColor ?? Colors.grey[200],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(product.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Expanded(
            child: Text(
              product.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to handle "See all" tap actions
  void handleSeeAllTap(String sectionName) {
    // Implement your logic for handling "See all" tap
    // ignore: avoid_print
    print('See all tapped for $sectionName');
    // Optionally navigate or perform action
  }

  // Function to navigate to product detail screen
  void navigateToProductDetail(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(product: product),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;

  SectionTitle({required this.title, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: const Text(
              AppStrings.seeAllText,
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
