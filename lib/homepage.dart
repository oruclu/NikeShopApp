// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shopapp/constants.dart';
import 'package:shopapp/product_details.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:shopapp/shop_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Product {
  String title;
  String? category;
  String path;
  List<Color>? colors;
  String? price;
  Product({
    required this.title,
    this.category,
    required this.path,
    this.colors,
    this.price,
  });
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [
    Product(
        title: 'Nike Air Max 50',
        category: 'Men\'s shoes',
        path: 'asset/images/nike1.png'),
    Product(
        title: 'Nike Air Max 70',
        category: 'Men\'s shoes',
        path: 'asset/images/nike2.png'),
    Product(
        title: 'Nike Air Max 90',
        category: 'Men\'s shoes',
        path: 'asset/images/nike3.png'),
    Product(
        title: 'Nike waffle\nOne SE',
        path: 'asset/images/nike2.png',
        colors: [Colors.amber, Colors.green],
        price: '\$159'),
    Product(
        title: 'Nike Legend\nEssential',
        path: 'asset/images/nike3.png',
        colors: [Colors.black, Colors.teal, Colors.deepOrangeAccent],
        price: '\$189'),
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    EdgeInsets padding = MediaQuery.of(context).padding;
    double screenHeight = height -
        padding.top -
        padding.bottom -
        kBottomNavigationBarHeight -
        kToolbarHeight;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 16, top: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Shop.menu),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Image.asset('asset/images/nike.png', width: 60),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Shop.cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///----------    New Collection    --------------////////////
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'New Collection',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Nike original 2023',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red.shade800,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductDetails(),
                    )),
                child: SizedBox(
                  height: 260,
                  child: Stack(
                    children: [
                      PageView.builder(
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (value) {
                            setState(() {
                              activeIndex = value;
                            });
                          },
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            Product product = products[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.only(right: 16, left: 16),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    width: width * 0.92,
                                    height: 180,
                                    padding: const EdgeInsets.all(16),
                                    margin: const EdgeInsets.only(top: 32),
                                    decoration: BoxDecoration(
                                      color: cardBackColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          product.title,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          product.category ?? '',
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 24),
                                        Container(
                                          width: 110,
                                          height: 44,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            'Shop now',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                                  .withOpacity(0.85),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: -40,
                                    child: Image.asset(
                                      product.path,
                                      width: 280,
                                      height: 280,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: AnimatedSmoothIndicator(
                          activeIndex: activeIndex,
                          count: 3,
                          effect: const WormEffect(
                            dotWidth: 10,
                            dotHeight: 10,
                            activeDotColor: Color.fromARGB(255, 142, 30, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),

              ///----------       Categories       --------------////////////
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      const TabBar(
                        labelColor: Colors.black,
                        labelStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                        unselectedLabelColor: Colors.grey,
                        unselectedLabelStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                        tabs: [
                          Tab(
                            text: 'Lifestyle',
                          ),
                          Tab(
                            text: 'Running',
                          ),
                          Tab(
                            text: 'Tennis',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(children: [
                          GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 2 / 3),
                            padding: const EdgeInsets.only(left: 16, top: 8),
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              Product product = products[index + 3];
                              return Container(
                                margin: const EdgeInsets.only(right: 16),
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: cardBackColor,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: product.colors!
                                          .map((e) => Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    color: e,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2)),
                                                margin: const EdgeInsets.only(
                                                    right: 10, top: 12),
                                              ))
                                          .toList(),
                                    ),
                                    Image.asset(product.path),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.price ?? '',
                                              style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            const Text(
                                              'Price',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white70,
                                              border: Border.all(
                                                  color: Colors.grey.shade400),
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Shop.arrowright),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Container(
                            color: Colors.green,
                          ),
                          Container(
                            color: Colors.purple,
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        destinations: [
          const Icon(Shop.home),
          Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                //borderRadius: BorderRadius.circular(32)
              ),
              child: const Icon(
                Shop.search,
                color: Colors.white,
              )),
          const Icon(Shop.heart),
        ],
      ),
    );
  }
}
