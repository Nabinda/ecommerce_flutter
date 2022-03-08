import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/product_model.dart';
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
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('product')
              .where("category", isEqualTo: widget.category)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if(!snapshot.hasData){
              return const Text("No Data");
            }else {
              final data = snapshot.data!;
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.75),
                  itemCount: data.docs.length,
                  itemBuilder: (context, index) {
                    ProductModel product = ProductModel.fromDocument(data.docs[index]);
                    return ProductInfo(product: product,);
                  });
            }
          }),
    );
  }
}
