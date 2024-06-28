import 'package:flutter/material.dart';
import 'package:shop/main.dart';
import '../constants/app_strings.dart';

class AccountScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const AccountScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/account_icons/profile.png'), // Replace with your profile image
                      radius: 30,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              AppStrings.accountName,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.edit, size: 16, color: Colors.green),
                          ],
                        ),
                        Text(
                          AppStrings.accountEmail,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                ListTile(
                  leading: Image.asset(
                      'assets/account_icons/Orders.png'), // Replace with your orders icon image
                  title: const Text(
                    AppStrings.ordersTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle Orders tap
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Image.asset(
                      'assets/account_icons/My_Details_icon.png'), // Replace with your details icon image
                  title: const Text(
                    AppStrings.myDetailsTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle My Details tap
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Image.asset(
                      'assets/account_icons/Delicery_address.png'), // Replace with your delivery address icon image
                  title: const Text(
                    AppStrings.deliveryAddressTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle Delivery Address tap
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Image.asset(
                      'assets/account_icons/Payment_methods.png'), // Replace with your payment icon image
                  title: const Text(
                    AppStrings.paymentMethodsTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle Payment Methods tap
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Image.asset(
                      'assets/account_icons/Promo_Cord_icon.png'), // Replace with your promo codes icon image
                  title: const Text(
                    AppStrings.promoCodesTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle Promo Codes tap
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Image.asset(
                      'assets/account_icons/Bell_icon.png'), // Replace with your notifications icon image
                  title: const Text(
                    AppStrings.notificationsTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle Notifications tap
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Image.asset(
                      'assets/account_icons/help_icon.png'), // Replace with your help icon image
                  title: const Text(
                    AppStrings.helpTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle Help tap
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Image.asset(
                      'assets/account_icons/about_icon.png'), // Replace with your about icon image
                  title: const Text(
                    AppStrings.aboutTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle About tap
                  },
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle logout button press (alternate method)
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              icon: const Icon(Icons.logout, color: Colors.green),
              label: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.logOutButtonTitle,
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.white, // Foreground color (text color)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                elevation: 1, // Increased elevation
              ),
            ),
          ),
        ],
      ),
    );
  }
}
