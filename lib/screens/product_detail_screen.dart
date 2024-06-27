import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/screens/favorite_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  bool _isFavorite = false;
  bool _showProductDetails = false;
  bool _isIncrementClicked = false;
  bool _isDecrementClicked = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = FavoriteScreen.favoriteItems.contains(widget.product);
  }

  // Function to increment quantity
  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  // Function to decrement quantity
  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  // Function to toggle favorite status
  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;

      if (_isFavorite) {
        FavoriteScreen.addToFavorites(widget.product);
      } else {
        FavoriteScreen.removeFromFavorites(widget.product);
      }
    });
  }

  // Function to toggle showing product details
  void _toggleProductDetails() {
    setState(() {
      _showProductDetails = !_showProductDetails;
    });
  }

  // Function to build the app bar
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      // title: Text(
      //   widget.product.name,
      //   style: TextStyle(fontSize: 20),
      // ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/icon_images/share.png'),
          ),
          onPressed: () {
            // Implement share functionality
          },
        ),
      ],
    );
  }

  // Function to build the product details section
  Widget _buildProductDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProductImage(),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProductName(),
                  SizedBox(height: 5),
                  Text(
                    '${widget.product.quantity},Price',
                    style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 120, 119, 119)),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite ? Colors.red : null,
              ),
              onPressed: _toggleFavorite,
            ),
          ],
        ),
        // SizedBox(height: 10),
        // _buildProductQuantity(),
        SizedBox(height: 20),
        _buildPriceAndQuantityControls(),
        SizedBox(height: 30),
        _buildProductDetailToggle(),
        if (_showProductDetails) _buildProductDescription(),
      ],
    );
  }

  // Function to build the product image
  Widget _buildProductImage() {
    return Center(
      child: Image.asset(
        widget.product.image,
        height: 200,
        width: 200,
        fit: BoxFit.contain,
      ),
    );
  }

  // Function to build the product name
  Widget _buildProductName() {
    return Text(
      widget.product.name,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  // Function to build the product quantity
  Widget _buildProductQuantity() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 253, 250, 250),
        borderRadius: BorderRadius.circular(12.0),
        border:
            Border.all(color: Color.fromARGB(255, 226, 225, 225), width: 1.5),
      ),
      child: Center(
        child: Text(
          '$_quantity',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  // Function to build the price and quantity controls row
  Widget _buildPriceAndQuantityControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildQuantityControls(),
        Text(
          '\$${(widget.product.price * _quantity).toStringAsFixed(2)}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Function to build the quantity controls (increment and decrement buttons)
  Widget _buildQuantityControls() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: _decrementQuantity,
          onTapDown: (_) {
            setState(() {
              _isDecrementClicked = true;
              _isIncrementClicked = false;
            });
          },
          onTapUp: (_) {
            setState(() {
              _isDecrementClicked = false;
            });
          },
          onTapCancel: () {
            setState(() {
              _isDecrementClicked = false;
            });
          },
          child: Icon(
            Icons.remove,
            color: _isDecrementClicked ? Colors.blue : Colors.black,
          ),
        ),
        SizedBox(width: 16),
        _buildProductQuantity(),
        SizedBox(width: 16),
        GestureDetector(
          onTap: _incrementQuantity,
          onTapDown: (_) {
            setState(() {
              _isIncrementClicked = true;
              _isDecrementClicked = false;
            });
          },
          onTapUp: (_) {
            setState(() {
              _isIncrementClicked = false;
            });
          },
          onTapCancel: () {
            setState(() {
              _isIncrementClicked = false;
            });
          },
          child: Icon(
            Icons.add,
            color: _isIncrementClicked ? Colors.blue : Colors.black,
          ),
        ),
      ],
    );
  }

  // Function to build the product detail toggle
  Widget _buildProductDetailToggle() {
    return GestureDetector(
      onTap: _toggleProductDetails,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Product Detail',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Icon(
            _showProductDetails
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            size: 30,
          ),
        ],
      ),
    );
  }

  // Function to build the product description
  Widget _buildProductDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          widget.product.description,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: _buildAppBar(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: _buildProductDetails(),
      ),
      bottomNavigationBar: _buildAddToBasketButton(),
    );
  }

  // Function to build the "Add to Basket" button
  Widget _buildAddToBasketButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          // Implement add to basket functionality
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff8E97FD),
          padding: EdgeInsets.symmetric(vertical: 19.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          'Add To Basket',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
