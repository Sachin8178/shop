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
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filters',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
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
            }).toList(),
            SizedBox(height: 16),
            Text(
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
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Apply filter logic
                },
                child: Text('Apply Filter'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff8E97FD),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
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
