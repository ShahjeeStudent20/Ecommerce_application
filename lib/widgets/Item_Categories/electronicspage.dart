import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/lists_models/itemslist.dart';
import 'package:ecommerce_app/screens/cartpage.dart';
import 'package:ecommerce_app/screens/detailspage.dart';
import 'package:flutter/material.dart';

class ElectronicsPage extends StatelessWidget {
  const ElectronicsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mystyle1 = const TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
    var mystyle2 = TextStyle(
        fontSize: 17, fontWeight: FontWeight.bold, color: Colors.teal.shade700);
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 35, right: 20, left: 20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth > 600 ? 3 : 2,
            mainAxisSpacing: 22.0,
            crossAxisSpacing: 28.0,
            childAspectRatio: screenWidth > 600 ? 0.7 : 0.8,
          ),
          itemCount: items.length > 10 ? 3 : items.length,
          itemBuilder: (context, index) {
            HomeItems home = items[index + 10];
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailPage(
                    home: home,
                  ),
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      spreadRadius: 2,
                      blurRadius: 25,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(6),
                        child: Image.asset(
                          home.image,
                          height: screenWidth * 0.35,
                          width: screenWidth * 0.40,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 3),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            home.title,
                            style: mystyle1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            home.price,
                            style: mystyle2,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CartPage(
                                  cartsitem: DetailPage.cartsitem,
                                ),
                              ));
                            },
                            child: const SizedBox(width: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
