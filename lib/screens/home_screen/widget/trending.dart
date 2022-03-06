import 'package:ecommerce/widgets/product_info.dart';
import 'package:flutter/material.dart';

class Trending extends StatelessWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return ProductInfo();
        },
        itemCount: 10,
      ),
    );
  }
}