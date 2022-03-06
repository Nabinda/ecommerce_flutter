import 'package:ecommerce/widgets/product_info.dart';
import 'package:flutter/material.dart';

class Sales extends StatelessWidget {
  const Sales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
