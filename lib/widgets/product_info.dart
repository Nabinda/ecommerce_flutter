import 'package:ecommerce/widgets/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'id',
      transitionOnUserGestures: true,
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, ProductDetailScreen.routeName);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
          decoration:
              BoxDecoration(color: Theme.of(context).primaryColor.withOpacity(0.5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                  'https://static-01.daraz.com.np/p/d9a7bd9c55ddfe60c2fd7346480e0281.jpg',
                  fit: BoxFit.fill,
                  height: 150),
              const SizedBox(
                height: 8,
              ),
              const Text('Mens Shoes',maxLines: 1,
              overflow: TextOverflow.ellipsis,),
              const SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  text: 'Rs. 1500 \t',
                  style: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontWeight: FontWeight.w500),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'Rs. 5500',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
