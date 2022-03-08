import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/widgets/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final ProductModel product;
  const ProductInfo({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: product.id,
      transitionOnUserGestures: true,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                      product: product,
                    )),
          );
        },
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(product.productURL[0],
                  fit: BoxFit.fill, width: 180, height: 150),
              const SizedBox(
                height: 8,
              ),
              Text(
                product.productName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  text: "Rs. " + product.productPrice + "\t",
                  style: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                      text: product.priceWithOutDisc != ''
                          ? "Rs. " + product.priceWithOutDisc
                          : '',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
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
