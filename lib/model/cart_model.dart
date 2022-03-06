import 'package:ecommerce/model/product_model.dart';

class CartModel {
  final String userId;
  final List<IndividualProduct> cart;
  CartModel({required this.userId, required this.cart});
}

class IndividualProduct {
  final int productId;
  final String productURL;
  final String productName;
  final String productPrice;
  final int productQuantity;
  IndividualProduct(
      {required this.productId,
      required this.productURL,
      required this.productName,
      required this.productPrice,
      required this.productQuantity});
}
