import 'package:flutter/material.dart';
import 'package:shop/main.dart'; // Import main.dart for accessing cartItems
import '../models/product.dart'; // Import Product model
import 'confirm_screen.dart'; // Import ConfirmationScreen for navigation

class CartScreen extends StatefulWidget {
  final List<Product> cartItems = MainScreen.cartItems;

  CartScreen({super.key}); // Use static cartItems from MainScreen

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _agreedToTerms = false;

  // Calculate total price of items in the cart
  double getTotalPrice() {
    return widget.cartItems.fold(0, (total, current) => total + current.price);
  }

  // Show checkout bottom sheet with options like delivery, payment, and total cost
  void showCheckoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),
                  Divider(thickness: 1, color: Color(0xFFE2E2E2)),
                  buildCheckoutOption(
                    title: 'Delivery Method',
                    subtitle: 'Select method',
                    amount: 'Select method',
                    onTap: () {
                      // Navigate to delivery method selection screen
                    },
                  ),
                  Divider(thickness: 1, color: Color(0xFFE2E2E2)),
                  buildCheckoutOption(
                    title: 'Payment',
                    subtitle: '',
                    amount: '',
                    icon: ImageIcon(
                      AssetImage('assets/icon_images/card.png'),
                    ),
                    onTap: () {
                      // Navigate to payment method selection screen
                    },
                  ),
                  Divider(thickness: 1, color: Color(0xFFE2E2E2)),
                  buildCheckoutOption(
                    title: 'Promo code',
                    subtitle: 'Pick discount',
                    amount: 'Pick discount',
                    onTap: () {
                      // Navigate to promo code selection screen
                    },
                  ),
                  Divider(thickness: 1, color: Color(0xFFE2E2E2)),
                  buildCheckoutOption(
                    title: 'Total Cost',
                    subtitle: '',
                    amount: '\$${getTotalPrice().toStringAsFixed(2)}',
                    onTap: () {
                      // Navigate to total cost details screen
                    },
                  ),
                  Divider(thickness: 1, color: Color(0xFFE2E2E2)),
                  SizedBox(height: 20),
                  // Terms and Conditions text
                  RichText(
                    text: TextSpan(
                      text: 'By placing an order you agree to our \n',
                      style: TextStyle(color: Color(0xFF7C7C7C)),
                      children: [
                        TextSpan(
                          text: 'Terms',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        TextSpan(
                          text: ' And ',
                        ),
                        TextSpan(
                          text: 'Conditions',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Button to place order
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmationScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        child: Text(
                          'Place Order',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 60),
                        backgroundColor: Color(0xff8E97FD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Helper method to build each checkout option tile
  Widget buildCheckoutOption({
    required String title,
    required String subtitle,
    required String amount,
    Widget? icon,
    VoidCallback? onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Color.fromARGB(255, 103, 101, 101), // Main text color
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon, // Icon widget for payment option
            SizedBox(width: 10),
          ],
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 7, 7, 7),
              fontSize: 15,
            ),
          ),
          SizedBox(width: 10),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: widget.cartItems.isEmpty
          ? Center(
              child:
                  Text('No items in cart'), // Display message if cart is empty
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Dismissible(
                              key: Key(widget.cartItems[index].name),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 20.0),
                                child: Image.asset(
                                  'assets/images/cross.png', // Replace with your cross image path
                                  color: Colors.white,
                                ),
                              ),
                              onDismissed: (direction) {
                                setState(() {
                                  widget.cartItems.removeAt(index);
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Display product image
                                    ClipRRect(
                                      child: Image.asset(
                                        widget.cartItems[index].image,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Display product name
                                            Text(
                                              widget.cartItems[index].name,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height:
                                                    1), // Adding space below the product name
                                            // Display quantity and price
                                            Text(
                                              '${widget.cartItems[index].quantity}, Price',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(
                                                height:
                                                    15), // Adding smaller space below the quantity
                                            // Display quantity selector and price
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                QuantitySelector(
                                                  initialQuantity: 1,
                                                  onChanged: (newQuantity) {
                                                    // Update quantity functionality here
                                                  },
                                                ),
                                                Text(
                                                  '\$${widget.cartItems[index].price.toStringAsFixed(2)}',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Delete button for removing item from cart
                                    IconButton(
                                      icon: Image.asset(
                                        'assets/icon_images/cro.png', // Replace with your cross image path
                                        width: 24,
                                        height: 24,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          widget.cartItems.removeAt(index);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                // Button to navigate to checkout
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      showCheckoutBottomSheet(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Go to Checkout',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold, // Bold text
                          ),
                        ),
                        Text(
                          '\$${getTotalPrice().toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold, // Bold text
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60),
                      backgroundColor: Color(0xff8E97FD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

// Widget for selecting quantity with increment and decrement buttons
class QuantitySelector extends StatefulWidget {
  final int initialQuantity;
  final ValueChanged<int> onChanged;

  QuantitySelector(
      {super.key, required this.initialQuantity, required this.onChanged});

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int _quantity = 1;
  bool _incrementTapped = false;
  bool _decrementTapped = false;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  // Increment quantity by 1
  void _incrementQuantity() {
    setState(() {
      _quantity++;
      widget.onChanged(_quantity);
      _incrementTapped = true;
      _decrementTapped = false;
    });
  }

  // Decrement quantity by 1, minimum quantity is 1
  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        widget.onChanged(_quantity);
        _decrementTapped = true;
        _incrementTapped = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Button to decrement quantity
        GestureDetector(
          onTap: _decrementQuantity,
          onTapDown: (_) {
            setState(() {
              _decrementTapped = true;
            });
          },
          onTapUp: (_) {
            setState(() {
              _decrementTapped = false;
            });
          },
          onTapCancel: () {
            setState(() {
              _decrementTapped = false;
            });
          },
          child: Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 225, 224, 224)),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(
              Icons.remove,
              color: _decrementTapped
                  ? Colors.green
                  : Color.fromARGB(255, 160, 159, 159),
            ),
          ),
        ),
        SizedBox(width: 15),
        // Display current quantity
        Text('$_quantity'),
        SizedBox(width: 15),
        // Button to increment quantity
        GestureDetector(
          onTap: _incrementQuantity,
          onTapDown: (_) {
            setState(() {
              _incrementTapped = true;
            });
          },
          onTapUp: (_) {
            setState(() {
              _incrementTapped = false;
            });
          },
          onTapCancel: () {
            setState(() {
              _incrementTapped = false;
            });
          },
          child: Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 225, 224, 224)),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(
              Icons.add,
              color: _incrementTapped
                  ? Colors.green
                  : const Color.fromARGB(255, 143, 141, 141),
            ),
          ),
        ),
      ],
    );
  }
}
