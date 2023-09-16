import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

import 'paymentpage.dart';

class ConfirmCustomer extends StatefulWidget {
  const ConfirmCustomer({super.key});

  @override
  State<ConfirmCustomer> createState() => _ConfirmCustomerState();
}

class _ConfirmCustomerState extends State<ConfirmCustomer> {
  final TextEditingController _customernamecontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _citycontroller = TextEditingController();
  final TextEditingController _specialcontroller = TextEditingController();
  final _formfield = GlobalKey<FormState>();

  @override
  void dispose() {
    _customernamecontroller.dispose();
    _addresscontroller.dispose();
    _phonecontroller.dispose();
    _citycontroller.dispose();
    _specialcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Confirm Your Details"),
          leading: const BackButton(),
          backgroundColor: appbarclr,
          foregroundColor: white,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formfield,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _customernamecontroller,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: itemclr,
                        labelText: "Customer Name",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter customer name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    controller: _addresscontroller,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: itemclr,
                        labelText: "Street Address",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person_search_rounded)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter your Address";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _phonecontroller,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: itemclr,
                        labelText: "Contact Number",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone)),
                    validator: (value) => value!.length < 11
                        ? 'Please Enter 11-digit Contact number'
                        : null,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _citycontroller,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: itemclr,
                        labelText: "City/State",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.location_city)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter your city/State";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _specialcontroller,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: itemclr,
                        labelText: "Special Information (optional)",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.info_outline)),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    if (_formfield.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentScreen(),
                          ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: btnclr,
                      minimumSize: const Size(180, 50)),
                  child: const Text(
                    "Continue to Proceed Payment",
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
