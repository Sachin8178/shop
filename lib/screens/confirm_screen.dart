import 'package:flutter/material.dart';
import 'package:shop/main.dart';

class ConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.blue,
                size: 100,
              ),
              SizedBox(height: 20),
              Text(
                'Your Order has been accepted',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Your items have been placed and it\'s on its way to being processed',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()
                          //totalPrice: getTotalPrice(),
                          ));
                },
                child: Text('Back to home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
