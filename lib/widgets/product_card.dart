import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final Function(Product) onAddToCart;

  ProductCard({
    required this.product,
    required this.onTap,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Increased width
      margin: EdgeInsets.all(1.0),
      child: Card(
        color: Colors.white, // Ensure card background is white
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(
              color: Color.fromARGB(247, 192, 192, 192),
              width: 0.3), // Added border
        ),
        elevation: 0, // No elevation as requested
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    product.image,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 14, // Decreased font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${product.quantity}, Priceg',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  height: 27,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Container(
                      width: 36, // Adjusted width for the button
                      height: 36, // Adjusted height for the button
                      decoration: BoxDecoration(
                        color: Color(0xff8E97FD),
                        borderRadius: BorderRadius.circular(
                            13), // Slightly rounded corners
                      ),
                      child: IconButton(
                        onPressed: () {
                          onAddToCart(product);
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
