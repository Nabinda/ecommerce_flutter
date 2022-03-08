import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final List<dynamic> productURL;
  final String productName;
  final String productShortDescription;
  final String productLongDescription;
  final String sellerName;
  final String sellerContact;
  final List<dynamic> productTag;
  final String category;
  final int quantity;
  final String productPrice;
  final String priceWithOutDisc;
  final String discPercentage;
  final List<dynamic> services;
  final List<dynamic> reviews;
  ProductModel(
      {required this.id,
      required this.productURL,
      required this.productName,
      required this.productShortDescription,
      required this.productLongDescription,
      required this.productTag,
      required this.sellerName,
      required this.sellerContact,
      required this.category,
      required this.quantity,
      required this.productPrice,
      required this.priceWithOutDisc,
      required this.discPercentage,
      required this.services,
      required this.reviews});
  factory ProductModel.fromDocument(QueryDocumentSnapshot data) {
    return ProductModel(
        id: data['id'],
        productURL: data['productURL'],
        productName: data['productName'],
        productShortDescription: data['productShortDescription'],
        productLongDescription: data['productLongDescription'],
        productTag: data['productTag'],
        sellerName: data['sellerName'],
        sellerContact: data['sellerContact'],
        category: data['category'],
        quantity: data['quantity'],
        productPrice: data['productPrice'],
        priceWithOutDisc: data['priceWithOutDisc'],
        discPercentage: data['discPercentage'],
        services: data['services'],
        reviews: data['reviews']);
  }
}
