import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/screens/category_listing_screen/category_listing_screen.dart';
import 'package:ecommerce/widgets/product_detail_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();
  static const String productDetailScreen = ProductDetailScreen.routeName;
  static const String categoryListingScreen = CategoryListingScreen.routeName;

  static final routes = <String, WidgetBuilder>{

    productDetailScreen: (BuildContext context) => ProductDetailScreen(
          product: ProductModel(
              id: 'id',
              productURL: <String>[],
              productName: 'productName',
              productShortDescription: 'productShortDescription',
              productLongDescription: 'productLongDescription',
              productTag: <String>[],
              sellerName: 'sellerName',
              sellerContact: 'sellerContact',
              category: 'category',
              quantity: 0,
              productPrice: 'productPrice',
              priceWithOutDisc: 'priceWithOutDisc',
              discPercentage: 'discPercentage',
              services: <String>[],
              reviews: <String>[]),
        ),
    categoryListingScreen: (BuildContext context) =>
        const CategoryListingScreen(category: ''),
  };
}
