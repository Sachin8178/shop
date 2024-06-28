// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_to_list_in_spreads, sort_child_properties_last

import 'package:flutter/material.dart';

class FilterDrawer extends StatefulWidget {
  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  Map<String, bool> categories = {
    'Eggs': false,
    'Noodles & Pasta': false,
    'Chips & Crisps': false,
    'Fast Food': false,
  };

  Map<String, bool> brands = {
    'Individual Collection': false,
    'Cocola': false,
    'Ifad': false,
    'Kazi Farms': false,
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filters',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...categories.keys.map((String key) {
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.green,
                title: Text(key),
                value: categories[key],
                onChanged: (bool? value) {
                  setState(() {
                    categories[key] = value ?? false;
                  });
                },
              );
              // ignore: duplicate_ignore
              // ignore: unnecessary_to_list_in_spreads
            }).toList(),
            const SizedBox(height: 16),
            const Text(
              'Brand',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...brands.keys.map((String key) {
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.green,
                title: Text(key),
                value: brands[key],
                onChanged: (bool? value) {
                  setState(() {
                    brands[key] = value ?? false;
                  });
                },
              );
            }).toList(),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Apply filter logic
                },
                child: const Text('Apply Filter'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff8E97FD),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
