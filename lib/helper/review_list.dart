import 'package:flutter/material.dart';

class ReviewLists extends StatelessWidget {
  final List<Map<String,String>> reviews;
  const ReviewLists({Key? key,required this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var review in reviews){
      widgetList.add(ReviewItem(review: review));
      widgetList.add(const SizedBox(height: 20.0,));
    }
    return Column(children: widgetList,);
  }
}
class ReviewItem extends StatelessWidget {
  final Map<String,String> review;
  const ReviewItem({Key? key,required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(review["userName"]!,style: const TextStyle(color: Colors.grey,fontSize: 12),),
            Text(review['reviewDate']!,style: const TextStyle(color: Colors.grey,fontSize: 12),)
          ],
        ),
        const SizedBox(height: 3.0,),
        Container(
            padding: const EdgeInsets.only(left: 8),
            child: Text(review['review']!,style: const TextStyle(fontSize: 14),))
      ],
    );
  }
}

