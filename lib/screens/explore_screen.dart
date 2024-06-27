import 'package:flutter/material.dart';
import '../models/category.dart';
import '../widgets/category_grid_item.dart';
import '../screens/filters_screen.dart';

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
    Colors.orange[200]!,
    Colors.blue[200]!,
    Colors.green[200]!,
    Colors.purple[200]!,
    Colors.red[200]!,
    Colors.teal[200]!,
    // Add more colors as needed
  ];

  // Define different border colors for each category item
  final List<Color> categoryBorderColors = [
    Colors.orange[400]!,
    Colors.blue[400]!,
    Colors.green[400]!,
    Colors.purple[400]!,
    Colors.red[400]!,
    Colors.teal[400]!,
    // Add more colors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Products'), // Title for the app bar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Search bar section
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Store', // Placeholder text for search
                      prefixIcon: Icon(Icons.search), // Search icon
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
                SizedBox(width: 10),
                IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/icon_images/filter.png'),
                  ), // Filter icon button
                  onPressed: () {
                    // Show filter options when filter icon is pressed
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => FilterBottomSheet(),
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
