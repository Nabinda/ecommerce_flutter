import 'package:ecommerce/screens/home_screen/widget/categories.dart';

class ProductModel {
  final String id;
  final String productName;
  final String productDescription;
  final String sellerName;
  final String sellerContact;
  final String category;
  final int quantity;
  final double price;
  ProductModel(
      {required this.id,
      required this.productName,
      required this.productDescription,
      required this.sellerName,
      required this.sellerContact,
      required this.category,
      required this.quantity,
      required this.price});
}
