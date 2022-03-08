import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/widgets/product_info.dart';
import 'package:flutter/material.dart';

import '../../../model/product_model.dart';

class Sales extends StatelessWidget {
  final String filter;
  const Sales({Key? key,required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('product')
            .where("productTag",arrayContains: filter)
            .snapshots(),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if(!snapshot.hasData){
            return const Text("No Data");
          }else {
            final data = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                ProductModel product = ProductModel.fromDocument(data.docs[index]);
                return ProductInfo(product: product,);
              },
              itemCount: data.docs.length,
            );
          }
        }
      ),
    );
  }
}
