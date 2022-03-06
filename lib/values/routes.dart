import 'package:ecommerce/screens/category_listing_screen/category_listing_screen.dart';
import 'package:ecommerce/widgets/product_detail_screen.dart';
import 'package:flutter/material.dart';

class Routes{
  Routes._();
  static const String productDetailScreen = ProductDetailScreen.routeName;
  static const String categoryListingScreen = CategoryListingScreen.routeName;


  static final routes = <String,WidgetBuilder>{
    productDetailScreen: (BuildContext context) => const ProductDetailScreen(),
    categoryListingScreen: (BuildContext context) => const CategoryListingScreen(category: ''),
  };
}