import 'package:flutter/material.dart';
import 'package:shopapp/shop_icons.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.only(left: 16, top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Shop.arrowleft),
          ),
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
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              'Nike Air Max 50',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            Text(
              'Men\'s shoes',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            Stack(
              children: [
                Image.asset(
                  'asset/images/niketext.png',
                ),
                Positioned.fill(
                  child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child:
                            Image.asset('asset/images/nike1.png', height: 440),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Size',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      sizeWidget(size: '40'),
                      sizeWidget(size: '41'),
                      sizeWidget(
                          size: '42',
                          backColor: Colors.black,
                          textColor: Colors.white),
                      sizeWidget(size: '43'),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 16,
                  child: Column(
                    children: [
                      const Text(
                        'Fav',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 44,
                        height: 44,
                        margin: const EdgeInsets.only(top: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Shop.heart),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 0,
                  child: Column(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        margin: const EdgeInsets.only(top: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      Container(
                        width: 44,
                        height: 44,
                        margin: const EdgeInsets.only(top: 16, bottom: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const Text(
                        'Color',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    left: 16,
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '\$159',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'Price',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
              ],
            ),
            Stack(
              children: [
                const SizedBox(width: 300, height: 244),
                const Positioned.fill(
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Text('Swipe down', style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
                Positioned.fill(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('asset/images/box.png', width: 200)),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(top: 26),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(32)),
                    child: Column(
                      children: const [
                        Icon(
                          Shop.cart,
                          color: Colors.white,
                          size: 28,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Icon(Icons.keyboard_double_arrow_down_rounded,
                            color: Colors.white70)
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container sizeWidget(
      {required String size,
      Color textColor = Colors.black,
      Color backColor = Colors.white}) {
    return Container(
      width: 44,
      height: 44,
      margin: const EdgeInsets.only(top: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backColor,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        size,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
