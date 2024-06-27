// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shop/screens/account_screen.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/explore_screen.dart';
import 'package:shop/screens/favorite_screen.dart';
import 'package:shop/screens/home_screen.dart';
import 'package:shop/models/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  static List<Product> cartItems = [];

  const MainScreen({super.key}); // Define a static list for cart items

  @override
  _MainScreenState createState() => _MainScreenState();

  // Method to add a product to the cart
  static void addToCart(Product product) {
    int existingIndex = cartItems.indexWhere((item) => item == product);

    if (existingIndex != -1) {
      // Product already exists in cart, update quantity and price
      cartItems[existingIndex] = Product(
        name: product.name,
        quantity: product.quantity,
        price: cartItems[existingIndex].price + product.price,
        description: product.description,
        image: product.image,
      );
    } else {
      // Product does not exist in cart, add it
      cartItems.add(product);
    }
  }

  // Method to remove a product from the cart
  static void removeFromCart(Product product) {
    cartItems.removeWhere((item) => item == product);
  }
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ExploreScreen(),
    CartScreen(),
    FavoriteScreen(),
    const AccountScreen(),
  ];

  // Method to handle item tap in the bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Method to get the appropriate icon color based on the selected index
  Color _getIconColor(int index) {
    return _selectedIndex == index ? Colors.blue : Colors.black54;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  // Method to build the bottom navigation bar
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      unselectedItemColor: Colors.black87, // Set unselected item color darker
      selectedItemColor: Colors.blue, // Set selected item color
      items: buildBottomNavigationBarItems(),
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed, // Ensure labels are always shown
    );
  }

  // Method to build the list of bottom navigation bar items
  List<BottomNavigationBarItem> buildBottomNavigationBarItems() {
    return <BottomNavigationBarItem>[
      buildBottomNavigationBarItem('assets/icon_images/store 1.png', 'Shop', 0),
      buildBottomNavigationBarItem('assets/icon_images/exp.png', 'Explore', 1),
      buildBottomNavigationBarItem('assets/icon_images/Vector.png', 'Cart', 2),
      buildBottomNavigationBarItem('assets/icon_images/fav.png', 'Favorite', 3),
      buildBottomNavigationBarItem(
          'assets/icon_images/account.png', 'Account', 4),
    ];
  }

  // Method to build a single bottom navigation bar item
  BottomNavigationBarItem buildBottomNavigationBarItem(
      String assetPath, String label, int index) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(assetPath),
        color: _getIconColor(index),
      ),
      label: label,
    );
  }
}
