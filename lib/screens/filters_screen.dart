import 'package:flutter/material.dart';

import '../constants/app_strings.dart'; // Import your constants

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  // Define categories and brands with initial states
  Map<String, bool> categories = {
    'Eggs': false,
    'Noodles & Pasta': false,
    'Chips & Crisps': false,
    'Fast Food': false,
    'Vegetables': false,
    'Fruits': false,
    'Dairy Products': false,
    'Spices': false,
    'Frozen Foods': false,
  };

  Map<String, bool> brands = {
    'Individual Collection': false,
    'Cocola': false,
    'Ifad': false,
    'Kazi Farms': false,
    'Fresho': false,
    'Organic Tasty': false,
    'Farmers Best': false,
    'Tasty Bites': false,
    'Sunrise Farms': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          MediaQuery.of(context).size.height * 0.9, // Adjust height as needed
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title and close button row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  AppStrings.filtersTitle,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the bottom sheet
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Categories section
            const Text(
              AppStrings.categoriesTitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              children: categories.keys.map((String key) {
                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.green,
                  title: Text(
                    key,
                    style: const TextStyle(fontSize: 16),
                  ),
                  value: categories[key]!,
                  onChanged: (bool? value) {
                    setState(() {
                      categories[key] = value ?? false;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Brands section
            const Text(
              AppStrings.brandsTitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              children: brands.keys.map((String key) {
                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.green,
                  title: Text(
                    key,
                    style: const TextStyle(fontSize: 16),
                  ),
                  value: brands[key]!,
                  onChanged: (bool? value) {
                    setState(() {
                      brands[key] = value ?? false;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Apply filter button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Implement apply filter logic here
                  Navigator.of(context)
                      .pop(); // Close the bottom sheet after applying filters
                },
                // ignore: sort_child_properties_last
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    AppStrings.applyFilterButtonTitle,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff8E97FD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
