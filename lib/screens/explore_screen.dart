import 'package:flutter/material.dart';
import '../models/category.dart';
import '../widgets/category_grid_item.dart';
import '../screens/filters_screen.dart';
import '../constants/app_strings.dart'; // Import your string constants file

// ignore: use_key_in_widget_constructors
class ExploreScreen extends StatelessWidget {
  // List of categories with names and corresponding images
  final List<Category> categories = [
    Category(
      name: 'Fresh Fruits & Vegetable',
      image: 'assets/category_images/fresh_fruits_vegetable.png',
    ),
    Category(
      name: 'Cooking Oil & Ghee',
      image: 'assets/category_images/cooking_oil_ghee.png',
    ),
    Category(
      name: 'Meat & Fish',
      image: 'assets/category_images/meat_fish.png',
    ),
    Category(
      name: 'Bakery & Snacks',
      image: 'assets/category_images/bakery_snacks.png',
    ),
    Category(
      name: 'Dairy & Eggs',
      image: 'assets/category_images/dairy_eggs.png',
    ),
    Category(
      name: 'Beverages',
      image: 'assets/category_images/beverages.png',
    ),
    // Add more categories here as needed
  ];

  // Define different background colors for each category item
  final List<Color> categoryBackgroundColors = [
    Colors.orange[400]!.withOpacity(0.2), // Lighter orange
    Colors.blue[400]!.withOpacity(0.2), // Lighter blue
    Colors.green[400]!.withOpacity(0.2), // Lighter green
    Colors.purple[400]!.withOpacity(0.2), // Lighter purple
    Colors.red[400]!.withOpacity(0.2), // Lighter red
    Colors.teal[400]!.withOpacity(0.2),
    // Add more colors as needed
  ];

  // Define different border colors for each category item
  final List<Color> categoryBorderColors = [
    Colors.orange[400]!.withOpacity(0.2), // Lighter orange
    Colors.blue[400]!.withOpacity(0.2), // Lighter blue
    Colors.green[400]!.withOpacity(0.2), // Lighter green
    Colors.purple[400]!.withOpacity(0.2), // Lighter purple
    Colors.red[400]!.withOpacity(0.2), // Lighter red
    Colors.teal[400]!.withOpacity(0.2),
    // Add more colors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.findProductsTitle), // Use string constant
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Search bar section
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText:
                          AppStrings.searchStoreHint, // Use string constant
                      prefixIcon: const Icon(Icons.search), // Search icon
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor:
                          Colors.grey[200], // Background color of search bar
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const ImageIcon(
                    AssetImage('assets/icon_images/filter.png'),
                  ), // Filter icon button
                  onPressed: () {
                    // Show filter options when filter icon is pressed
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => const FilterBottomSheet(),
                    );
                  },
                ),
              ],
            ),
          ),
          // Category grid section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  childAspectRatio: 3 / 2, // Aspect ratio of grid items
                  crossAxisSpacing: 10, // Spacing between columns
                  mainAxisSpacing: 10, // Spacing between rows
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  // Build each category grid item
                  return CategoryGridItem(
                    category: categories[index],
                    backgroundColor: categoryBackgroundColors[
                        index % categoryBackgroundColors.length],
                    borderColor: categoryBorderColors[
                        index % categoryBorderColors.length],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
