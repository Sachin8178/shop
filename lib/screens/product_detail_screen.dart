// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/screens/favorite_screen.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_strings.dart';

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

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

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

  void _toggleProductDetails() {
    setState(() {
      _showProductDetails = !_showProductDetails;
    });
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(
          icon: const ImageIcon(
            AssetImage('assets/icon_images/share.png'),
          ),
          onPressed: () {
            // Implement share functionality
          },
        ),
      ],
    );
  }

  Widget _buildProductDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProductImage(),
        const SizedBox(height: AppDimensions.paddingAll),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: AppTextStyles.productName,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${widget.product.quantity},Price',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 120, 119, 119)),
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
        const SizedBox(height: AppDimensions.paddingAll),
        _buildPriceAndQuantityControls(),
        const SizedBox(height: 30),
        _buildProductDetailToggle(),
        if (_showProductDetails) _buildProductDescription(),
      ],
    );
  }

  Widget _buildProductImage() {
    return Center(
      child: Image.asset(
        widget.product.image,
        height: AppDimensions.productImageSize,
        width: AppDimensions.productImageSize,
        fit: BoxFit.contain,
      ),
    );
  }

  // ignore: unused_element
  Widget _buildProductName() {
    return Text(
      widget.product.name,
      style: AppTextStyles.productName,
    );
  }

  Widget _buildProductQuantity() {
    return Container(
      width: AppDimensions.productQuantityBoxSize,
      height: AppDimensions.productQuantityBoxSize,
      decoration: BoxDecoration(
        color: AppColors.quantityBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: AppColors.quantityBorder, width: 1.5),
      ),
      child: Center(
        child: Text(
          '$_quantity',
          style:
              const TextStyle(fontSize: AppDimensions.productQuantityTextSize),
        ),
      ),
    );
  }

  Widget _buildPriceAndQuantityControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildQuantityControls(),
        Text(
          '\$${(widget.product.price * _quantity).toStringAsFixed(2)}',
          style: const TextStyle(
              fontSize: AppDimensions.priceFontSize,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

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
            color: _isDecrementClicked
                ? AppColors.incrementDecrementColor
                : AppColors.textPrimary,
          ),
        ),
        const SizedBox(width: AppDimensions.quantityControlsSpacing),
        _buildProductQuantity(),
        const SizedBox(width: AppDimensions.quantityControlsSpacing),
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
            color: _isIncrementClicked
                ? AppColors.incrementDecrementColor
                : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildProductDetailToggle() {
    return GestureDetector(
      onTap: _toggleProductDetails,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            AppStrings.productDetailToggleText,
            style: TextStyle(
                fontSize: AppDimensions.productDetailToggleFontSize,
                fontWeight: FontWeight.bold),
          ),
          Icon(
            _showProductDetails
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            size: AppDimensions.productDetailToggleIconSize,
          ),
        ],
      ),
    );
  }

  Widget _buildProductDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          widget.product.description,
          style: AppTextStyles.productDescription,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppDimensions.appBarHeight),
        child: _buildAppBar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.paddingAll),
        child: _buildProductDetails(),
      ),
      bottomNavigationBar: _buildAddToBasketButton(),
    );
  }

  Widget _buildAddToBasketButton() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.paddingAll),
      child: ElevatedButton(
        onPressed: () {
          // Implement add to basket functionality
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.addToBasketButtonPaddingVertical),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                AppDimensions.addToBasketButtonBorderRadius),
          ),
        ),
        child: const Text(
          AppStrings.addToBasketButtonTitle,
          style: TextStyle(
              fontSize: AppDimensions.priceFontSize, color: Colors.white),
        ),
      ),
    );
  }
}
