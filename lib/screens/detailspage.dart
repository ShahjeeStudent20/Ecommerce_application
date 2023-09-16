import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/lists_models/itemslist.dart';
import 'package:flutter/material.dart';

import 'cartpage.dart';

class DetailPage extends StatefulWidget {
  final HomeItems home;

  const DetailPage({super.key, required this.home});

  static List<HomeItems> cartsitem = [];

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var mystyle1 = const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    var mystyle2 = const TextStyle(
        fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black);
    var mystyle3 = const TextStyle(fontSize: 16, color: Colors.black45);
    var mystyle4 = const TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
    var descstyle1 = const TextStyle(fontSize: 20, color: Colors.black);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,
        leading: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: grey),
          margin: const EdgeInsets.all(10),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop(); // Navigate back
              },
              icon: const Icon(
                Icons.arrow_back,
                color: black,
              )),
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              widget.home.image,
              height: 370,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.6,
              maxChildSize: 1.0,
              minChildSize: 0.5,
              builder: (context, ScrollController) {
                return Container(
                  padding: const EdgeInsets.all(5),
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      // color: Color(0xFF00A368),
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: SingleChildScrollView(
                    controller: ScrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, bottom: 10, right: 15, left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  widget.home.title.toString(),
                                  textAlign: TextAlign.left,
                                  style: mystyle1,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Ink(
                                  child: const Row(children: [
                                    Icon(
                                      Icons.favorite_rounded,
                                      size: 33,
                                      color: iconscolor,
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, bottom: 15),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: iconscolor,
                              ),
                              Text(
                                "4.9 (40)",
                                style: mystyle3,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, bottom: 20),
                          child: Text(
                            widget.home.price.toString(),
                            style: mystyle4,
                          ),
                        ),
                        Divider(
                          thickness: 4,
                          color: Colors.blueGrey.shade100,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, bottom: 20, top: 20),
                              child: Text(
                                "Description",
                                style: mystyle2,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, bottom: 20, top: 20),
                          child: Text(
                            widget.home.desc.toString(),
                            style: descstyle1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.sizeOf(context).height / 10,
        decoration: BoxDecoration(
          color: detailbtn,
          boxShadow: [
            BoxShadow(
              color: grey,
              blurRadius: 5,
              spreadRadius: 2,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  DetailPage.cartsitem.add(widget.home);
                });
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CartPage(
                    cartsitem: DetailPage.cartsitem,
                  ),
                ));
              },
              child: const Row(children: [
                Icon(
                  Icons.add_shopping_cart_sharp,
                  size: 26,
                ),
                Text("Add To cart",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
