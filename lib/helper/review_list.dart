import 'package:flutter/material.dart';

import '../values/time_ago.dart';

class ReviewLists extends StatelessWidget {
  final List<dynamic> reviews;
  const ReviewLists({Key? key, required this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var review in reviews) {
      widgetList.add(ReviewItem(review: review));
      widgetList.add(const SizedBox(
        height: 20.0,
      ));
    }
    return reviews.isNotEmpty
        ? Column(
            children: widgetList,
          )
        : const Text("No Reviews");
  }
}

class ReviewItem extends StatelessWidget {
  final Map<String, dynamic> review;
   ReviewItem({Key? key, required this.review}) : super(key: key);
  final TimeAgo timeAgo = TimeAgo();
  @override
  Widget build(BuildContext context) {
    return review["userName"] != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    review["userName"],
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                   timeAgo.uploadTimeAgo(review['reviewTime']),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
              const SizedBox(
                height: 3.0,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    review['review'],
                    style: const TextStyle(fontSize: 14),
                  ))
            ],
          )
        : const Text('');
  }
}
