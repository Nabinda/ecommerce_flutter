import 'package:ecommerce/helper/review_list.dart';
import 'package:ecommerce/helper/unordered_list.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/widgets/product_image_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/values/custom_fonts.dart' as font;

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);
  static const routeName = "/product_detail_screen";

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool showReview = false;
  List<Map<String, String>> reviews = [
    {
      "userName": "Ram Bahadur",
      "review":
          "Nice product I like it,Nice product I like it,Nice product I like it",
      "reviewDate": "1 week ago"
    },
    {
      "userName": "Shyam Bahadur",
      "review": "Nice product I like it",
      "reviewDate": "1 month ago"
    },
    {
      "userName": "Hari Bahadur",
      "review": "Nice product I like it",
      "reviewDate": "2 month ago"
    },
    {
      "userName": "Ram Bahadur",
      "review":
          "Nice product I like it,Nice product I like it,Nice product I like it",
      "reviewDate": "1 week ago"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Hero(
              tag: 1,
              createRectTween: (begin, end) {
                return MaterialRectArcTween(begin: end, end: begin);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageSlider(imageURL: widget.product.productURL),
                  spacing(10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.productName,
                          style: font.CustomFonts.productTitle,
                        ),
                        spacing(8),
                        Text(
                          widget.product.productShortDescription,
                          style: font.CustomFonts.normalText,
                        ),
                        spacing(8),
                        RichText(
                          text: TextSpan(
                            text: 'Rs.' + widget.product.productPrice,
                            style: TextStyle(
                                color: Theme.of(context).indicatorColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            children: <TextSpan>[
                              const TextSpan(text: '\t\t'),
                              widget.product.discPercentage != ''
                                  ? TextSpan(
                                      text: 'Rs. ' +
                                          widget.product.priceWithOutDisc,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    )
                                  : const TextSpan(text: ''),
                              widget.product.discPercentage != ''
                                  ? TextSpan(
                                      text: "\t\t" +
                                          widget.product.discPercentage +
                                          "% OFF",
                                      style: TextStyle(
                                        color: Theme.of(context).indicatorColor,
                                        fontSize: 16,
                                      ),
                                    )
                                  : const TextSpan(text: ''),
                            ],
                          ),
                        ),
                        int.parse(widget.product.productPrice) > 0
                            ? Text(
                                '\t\t\tIn Stock',
                                style: TextStyle(
                                    color: Theme.of(context).indicatorColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              )
                            : Text(
                                '\t\tSold Out!!!',
                                style: TextStyle(
                                    color: Theme.of(context).indicatorColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                        spacing(2),
                        horizontalLine(context),
                        labeling("Services"),
                        spacing(8),
                        displayService(widget.product.services),
                        horizontalLine(context),
                        widget.product.reviews.isNotEmpty
                            ? ExpandablePanel(
                                header: labeling("Reviews"),
                                collapsed: Container(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: ReviewItem(
                                    review: widget.product.reviews[0],
                                  ),
                                ),
                                expanded: displayReview(widget.product.reviews))
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  labeling("Reviews"),
                                  spacing(8),
                                  const Center(
                                      child: Text(
                                    "\nNo Reviews",
                                    style: font.CustomFonts.categoryFont,
                                  ))
                                ],
                              ),
                        spacing(2),
                        horizontalLine(context),
                        labeling("Descriptions"),
                        spacing(8),
                        Container(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text(
                              widget.product.productLongDescription,
                              textAlign: TextAlign.justify,
                              style: font.CustomFonts.normalText,
                            )),
                        spacing(15)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 5.0),
        height: 55.0,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: bottomNavBarButtons(context),
      ),
    );
  }

  Widget spacing(double size) => SizedBox(
        height: size,
      );

  Widget horizontalLine(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: Theme.of(context).indicatorColor.withOpacity(0.4),
    );
  }

  Widget labeling(String text) => Text(
        "\t\t" + text,
        style: font.CustomFonts.labeling,
      );

  Widget displayService(List<dynamic> service) {
    return Container(
        padding: const EdgeInsets.only(left: 22),
        child: UnorderedList(
          texts: service,
          style: font.CustomFonts.normalText,
        ));
  }

  Widget displayReview(List<dynamic> review) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: ReviewLists(reviews: review),
    );
  }

  Widget bottomNavBarButtons(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Theme.of(context).toggleableActiveColor.withOpacity(0.7),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add_shopping_cart),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text("ADD TO CART")
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Theme.of(context).toggleableActiveColor.withOpacity(0.7),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Icon(Icons.shopping_bag), Text("BUY NOW")],
              ),
            ),
          )
        ],
      ),
    );
  }
}
