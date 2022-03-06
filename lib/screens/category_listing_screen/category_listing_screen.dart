import 'package:ecommerce/widgets/product_info.dart';
import 'package:flutter/material.dart';

class CategoryListingScreen extends StatefulWidget {
  final String category;
  static const routeName = "/category_listing_screen";
  const CategoryListingScreen({Key? key, required this.category})
      : super(key: key);

  @override
  State<CategoryListingScreen> createState() => _CategoryListingScreenState();
}

class _CategoryListingScreenState extends State<CategoryListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.75),
          itemCount: 20,
          itemBuilder: (context, index) {
            return ProductInfo();
          }),
    );
  }
}
