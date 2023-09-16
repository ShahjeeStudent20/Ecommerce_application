import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/lists_models/itemslist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'confirmationPages/customer_detailform.dart';
import 'homepage.dart';

class CartPage extends StatefulWidget {
  final List<HomeItems> cartsitem;
  const CartPage({
    super.key,
    required this.cartsitem,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isLoading = false;
  bool _orderConfirmed = false;
  void _submitOrder() {
    setState(() {
      _orderConfirmed = true;
    });
  }

  String getConfirmButtonText() {
    if (_orderConfirmed) {
      return "Order is on the way";
    } else {
      return "Confirm Order";
    }
  }

  void _calculateTotal() {
    for (int i = 0; i < widget.cartsitem.length; i++) {}
  }

  //remove items function declare
  void _removeItems(int index) {
    setState(() {
      widget.cartsitem.removeAt(index);
      _calculateTotal();
    });
  }

//Initializing qty list with values
  @override
  void initState() {
    super.initState();
    _calculateTotal();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //Navbar
        bottomNavigationBar: Container(
          height: 80,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          decoration: const BoxDecoration(color: bottomclr),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 220,
                child: OutlinedButton(
                  onPressed: _orderConfirmed
                      ? null // Disable button if order is already confirmed
                      : () {
                          _submitOrder();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ConfirmCustomer(),
                            ),
                          );
                        },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          _orderConfirmed ? green : btnclr)),
                  child: Text(
                    getConfirmButtonText(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: appbarclr,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text("Cart Items"),
        ),
        body: ListView.builder(
          itemCount: widget.cartsitem.length,
          itemBuilder: (context, index) {
            HomeItems item = widget.cartsitem[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: InkWell(
                    child: const Icon(CupertinoIcons.xmark_rectangle_fill,
                        size: 26),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: const EdgeInsets.all(10),
                            title: const Text("Remove Item(s)"),
                            content:
                                const Text("Are you sure you want to remove "
                                    "this item from the cart?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  _removeItems(index);
                                },
                                child: const Text('Yes'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      height: 100,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(item.image),
                            radius: 40,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            item.title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text('${item.price}'),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 3,
                  color: Colors.grey,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
