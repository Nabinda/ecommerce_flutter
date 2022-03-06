import 'package:ecommerce/helper/review_list.dart';
import 'package:ecommerce/helper/unordered_list.dart';
import 'package:ecommerce/widgets/product_image_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/values/custom_fonts.dart' as font;

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = "/product_detail_screen";

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool showReview = false;
  String productName = "BERSACHE";

  String productShortDescription =
      "Bersache Sports Running, Loafers, Sneakers Shoes for Men ORIWFSH-1657 Running Shoes For Men";

  String productLongDescription =
      "100% genuine (The SELLER guarantees the authenticity of the product)Converse?s range of sneakers need no introduction as they are a global brand with almost cult-like following. Steeped in history, unique in design and reliable in function, Converse has never failed anyone. So, make your feet happy and skip to the beat of your life?s rhythm with this fun sneakers.";

  List<String> services = ["7 Days Returns", "Warranty not Available"];

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

  int productQuantity = 10;

  double productPrice = 1500;

  double discPrice = 2500;

  double discPercentage = 35;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Hero(
              tag: 'id',
              createRectTween: (begin, end) {
                return MaterialRectArcTween(begin: end, end: begin);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductImageSlider(),
                  spacing(10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: font.CustomFonts.productTitle,
                        ),
                        spacing(8),
                        Text(
                          productShortDescription,
                          style: font.CustomFonts.normalText,
                        ),
                        spacing(8),
                        productQuantity > 0
                            ? RichText(
                                text: TextSpan(
                                  text: 'Rs.' + productPrice.toStringAsFixed(2),
                                  style: TextStyle(
                                      color: Theme.of(context).indicatorColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  children: <TextSpan>[
                                    const TextSpan(text: '\t\t'),
                                    discPercentage > 0
                                        ? TextSpan(
                                            text: 'Rs. ' +
                                                discPrice.toStringAsFixed(2),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          )
                                        : const TextSpan(text: ''),
                                    discPercentage > 0
                                        ? TextSpan(
                                            text: "\t\t" +
                                                discPercentage
                                                    .toStringAsFixed(0) +
                                                "% OFF",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .indicatorColor,
                                              fontSize: 16,
                                            ),
                                          )
                                        : const TextSpan(text: ''),
                                  ],
                                ),
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
                        displayService(services),
                        horizontalLine(context),
                        ExpandablePanel(
                            header: labeling("Reviews"),
                            collapsed: Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: ReviewItem(
                                review: reviews[0],
                              ),
                            ),
                            expanded: displayReview(reviews)),
                        spacing(2),
                        horizontalLine(context),
                        labeling("Descriptions"),
                        spacing(8),
                        Container(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text(
                              productLongDescription,
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

  Widget displayService(List<String> service) {
    return Container(
        padding: const EdgeInsets.only(left: 22),
        child: UnorderedList(
          texts: service,
          style: font.CustomFonts.normalText,
        ));
  }

  Widget displayReview(List<Map<String, String>> review) {
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
