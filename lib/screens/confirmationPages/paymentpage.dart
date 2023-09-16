import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

import 'ordersuccess_final.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedType = 1;

  //Payment list
  final List<PaymentMethod> paymentMethods = [
    PaymentMethod(id: 1, name: "Amazon Pay", imageAsset: "images/pay1.png"),
    PaymentMethod(id: 2, name: "Google Pay", imageAsset: "images/pay2.jpg"),
    PaymentMethod(id: 3, name: "Visa", imageAsset: "images/pay3.jpg"),
    PaymentMethod(id: 4, name: "MasterCard", imageAsset: "images/pay4.jpg"),
    PaymentMethod(id: 5, name: "Paypal", imageAsset: "images/pay5.png"),
    PaymentMethod(
        id: 6, name: "Cash on Delivery", imageAsset: "images/pay6.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Method"),
        leading: const BackButton(),
        backgroundColor: transparent,
        foregroundColor: black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: paymentMethods.length,
                    itemBuilder: (context, index) {
                      final paymentMethod = paymentMethods[index];
                      return PaymentRadioTile(
                          value: paymentMethod.id,
                          label: paymentMethod.name,
                          imageAsset: paymentMethod.imageAsset,
                          selectedType: _selectedType,
                          onTypeChanged: (int type) {
                            setState(() {
                              _selectedType = type;
                            });
                          });
                    }),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderConfirmPage(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: btnclr,
                      minimumSize: Size(MediaQuery.sizeOf(context).width * 0.5,
                          MediaQuery.sizeOf(context).height / 15)),
                  child: const Text(
                    "Pay Now",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentMethod {
  final int id;
  final String name;
  final String imageAsset;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.imageAsset,
  });
}

class PaymentRadioTile extends StatelessWidget {
  final int value;
  final String label;
  final String imageAsset;
  final int selectedType;
  final ValueChanged<int> onTypeChanged;

  const PaymentRadioTile({super.key, 
    required this.value,
    required this.label,
    required this.imageAsset,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      groupValue: selectedType,
      onChanged: (int? newValue) {
        if (newValue != null) {
          onTypeChanged(newValue);
        }
      },
      activeColor: red,
      title: Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: selectedType == value ? black : grey,
        ),
      ),
      secondary: Image.asset(
        imageAsset,
        width: 40,
        height: MediaQuery.sizeOf(context).height / 15,
      ),
    );
  }
}
