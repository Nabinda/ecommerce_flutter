import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network('https://static-01.daraz.com.np/p/d9a7bd9c55ddfe60c2fd7346480e0281.jpg',height: 150),
          SizedBox(height: 8,),
          Text('Mens Shoes'),
          SizedBox(height: 5,),
          Text('Rs. 5500'),
        ],
      ),
    );
  }
}
