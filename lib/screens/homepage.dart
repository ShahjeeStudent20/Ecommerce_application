import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/screens/cartpage.dart';
import 'package:ecommerce_app/screens/detailspage.dart';
import 'package:ecommerce_app/widgets/Item_Categories/allitems.dart';
import 'package:ecommerce_app/widgets/Item_Categories/electronicspage.dart';
import 'package:ecommerce_app/widgets/Item_Categories/grocerypage.dart';
import 'package:ecommerce_app/widgets/Item_Categories/mobilepage.dart';
import 'package:ecommerce_app/widgets/Item_Categories/shirtspage.dart';
import 'package:ecommerce_app/widgets/Item_Categories/shoespage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appbarclr,
          title: const Text(
            "PakShop",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: "All Items"),
                Tab(text: "Electronics"),
                Tab(text: "Mobiles"),
                Tab(text: "Grocery"),
                Tab(text: "Shoes"),
                Tab(text: "Shirts"),
              ],
              indicatorColor: white,
              labelColor: white,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelStyle: const TextStyle(fontSize: 14),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 5.0,
              isScrollable: true),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            AllItemsPage(),
            ElectronicsPage(),
            MobilesPage(),
            GroceryPage(),
            ShoesPage(),
            ShirtPage(),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) =>
        //                 CartPage(cartsitem: DetailPage.cartsitem)));
        //   },
        //   backgroundColor: appbarclr,
        //   child: const Icon(Icons.shopping_cart_sharp),
        // ),
        floatingActionButton: SizedBox(
          height: 60,
          width: 70,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: appbarclr,
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CartPage(cartsitem: DetailPage.cartsitem)));
                },
                icon: const Icon(Icons.shopping_cart)),
          ),
        ),
      ),
    );
  }
}
