import 'package:ecommerce/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier{
  final List<CategoryModel> _categories = [
    CategoryModel(id: 1, categoryName: "Electronics", categoryURL: "https://ecommerce.ccc2020.fr/wp-content/uploads/2020/10/electronic-gadgets.jpeg"),
    CategoryModel(id: 2, categoryName: "Home Appliance", categoryURL: "https://assets.bizclikmedia.net/1336/d675f976d7928ca21831e5521b269885:153e3573aee52b14472a523ce0e11a04/gettyimages-1301959047-0-jpg.webp"),
    CategoryModel(id: 3, categoryName: "Shoes", categoryURL: "https://static-01.daraz.com.np/p/d9a7bd9c55ddfe60c2fd7346480e0281.jpg"),
    CategoryModel(id: 4, categoryName: "Watch", categoryURL: "https://pick-kart.com/wp-content/uploads/2021/08/Luxury-Watch.jpg"),
    CategoryModel(id: 5, categoryName: "Clothes", categoryURL: "https://media.gq.com/photos/6058bd068ae7a8517d576d5f/16:9/w_320%2Cc_limit/spring-mesnwear.jpg"),
    CategoryModel(id: 6, categoryName: "Sun Glasses", categoryURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROZkTloUpwczUDjYIC620nhIRrD6C9v2E3pQ&usqp=CAU"),
   // CategoryModel(id: 7, categoryName: "Video Games", categoryURL: "https://imageio.forbes.com/specials-images/imageserve/61d6376afb41b047d0299df8/Video-Gamer-Mouse--Keyboard--Headphones-and-Controller/1960x0.jpg?fit=bounds&format=jpg&width=960"),
  ];

  List<CategoryModel> getCategories(){
    return _categories;
  }
}