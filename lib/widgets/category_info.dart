import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/screens/category_listing_screen/category_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/values/custom_fonts.dart' as font;
class CategoryInfo extends StatelessWidget {
  final CategoryModel category;
  const CategoryInfo({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategoryListingScreen(category: category.categoryName,)
          ),
        );
      },
      child: Container(
        width: 220,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(category.categoryURL, fit: BoxFit.fill, height: 150,width: 250,),
            const SizedBox(
              height: 8,
            ),
            Center(child: Text(category.categoryName,style: font.CustomFonts.categoryFont,)),
          ],
        ),
      ),
    );
  }
}
