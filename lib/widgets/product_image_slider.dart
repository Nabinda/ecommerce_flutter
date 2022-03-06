import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({Key? key}) : super(key: key);

  @override
  _ProductImageSliderState createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final List<String> imgList = [
    'https://www.famousfootwear.com/blob/product-images/20000/18/74/4/18744_pair_medium.jpg',
    'https://static-01.daraz.com.np/p/d9a7bd9c55ddfe60c2fd7346480e0281.jpg',
    'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/7c2fff38-9f89-40f1-bbcf-ffbfaab5adbc/wio-8-road-running-shoes-S6jPM3.png',
    'https://assetscdn1.paytm.com/images/catalog/product/F/FO/FOOCASTOES-MEN-A-J-11492737166B659/1607070760746_0..jpg',
  ];
  final CarouselController _controller = CarouselController();
  int imageIndex = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: <Widget>[
          CarouselSlider(
            items: sliders(),
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  imageIndex = index + 1;
                });
              },
              height: MediaQuery.of(context).size.height * 0.33,
            ),
            carouselController: _controller,
          ),
          Positioned(
              bottom: 15,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Container(
                    color: Colors.black.withOpacity(0.6),
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 10.0),
                    child: Text(
                      imageIndex.toString() + "/" + imgList.length.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  )))),
          Positioned(
              top: 5,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                  primary: Theme.of(context)
                      .primaryColor
                      .withOpacity(0.5), // <-- Splash color
                ),
              )),
        ],
      ),
    );
  }

  List<Widget> sliders() {
    return imgList
        .map((item) => Image.network(item, fit: BoxFit.fill))
        .toList();
  }
}
