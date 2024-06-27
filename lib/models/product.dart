import 'dart:ui';

class Product {
  final String name;
  String quantity;
  final double price;
  final String description;
  final String image;
  final Color? backgroundColor;

  Product({
    required this.name,
    required this.quantity,
    required this.price,
    required this.description,
    required this.image,
    this.backgroundColor,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.name == name &&
        other.quantity == quantity &&
        // other.price == price &&
        other.description == description &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        quantity.hashCode ^
        price.hashCode ^
        description.hashCode ^
        image.hashCode;
  }

  void updateQuantity(String newQuantity) {
    quantity = newQuantity;
  }
}
