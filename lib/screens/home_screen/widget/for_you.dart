import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/widgets/product_info.dart';
import 'package:flutter/material.dart';

import '../../../model/product_model.dart';

class ForYou extends StatelessWidget {
  const ForYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('product')
              .where("productTag",arrayContains: 'For You')
              .snapshots(),
          builder: (context,snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if(!snapshot.hasData){
              return const Text("No Data");
            }else {
              final data = snapshot.data!;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.75),
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
