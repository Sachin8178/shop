import 'package:flutter/material.dart';
import 'package:shop/main.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Afsar Hossen'),
            subtitle: Text('afu****@gmail.com'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Orders'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle Orders tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Details'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle My Details tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Payment Methods'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle Payment Methods tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Delivery Address'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle Delivery Address tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_offer),
            title: const Text('Promo Codes'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle Promo Codes tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle Notifications tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle Help tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle About tap
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to home screen
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.green),
                label: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.green),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green,
                  backgroundColor: Colors.white,
                  shadowColor: Colors.grey,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
