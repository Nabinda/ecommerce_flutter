import 'package:ecommerce/provider/category_provider.dart';
import 'package:ecommerce/widgets/category_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoryProvider>(context,listen: false).getCategories();
    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return CategoryInfo(category: categories[index],);
        },
        itemCount: categories.length,
      ),
    );
  }
}
