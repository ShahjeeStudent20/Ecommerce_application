import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/screens/homepage.dart';
import 'package:flutter/material.dart';

class OrderConfirmPage extends StatelessWidget {
  const OrderConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: blue,
              size: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Your order has been placed successfully!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: btnclr,
                  minimumSize: Size(MediaQuery.sizeOf(context).width * 0.5,
                      MediaQuery.sizeOf(context).height / 15)),
              child: const Text(
                "Continue Shopping",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
