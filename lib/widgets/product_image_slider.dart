import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  final List<dynamic> imageURL;
  const ProductImageSlider({Key? key,required this.imageURL}) : super(key: key);

  @override
  _ProductImageSliderState createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
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
                      imageIndex.toString() + "/" + widget.imageURL.length.toString(),
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
    return widget.imageURL
        .map((item) => Image.network(item, fit: BoxFit.fill))
        .toList();
  }
}
