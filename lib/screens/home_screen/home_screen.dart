import 'package:ecommerce/screens/home_screen/widget/categories.dart';
import 'package:ecommerce/screens/home_screen/widget/events_slider.dart';
import 'package:ecommerce/screens/home_screen/widget/sales.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/values/custom_fonts.dart' as font;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var safePadding = MediaQuery.of(context).padding.top;
    var navBarHeight = kBottomNavigationBarHeight;
    final height =
        MediaQuery.of(context).size.height - safePadding - navBarHeight;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: SafeArea(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width * 0.02, vertical: height * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: const Text(
                      "Let's Shop",
                      style: font.CustomFonts.header1,
                    ),
                  ),
                  spacing(),
                  EventsSlider(),
                  spacing(),
                  labeling("Flash Sale!!!"),
                  const Sales(),
                  spacing(),
                  labeling("Categories"),
                  const Categories(),
                  spacing(),
                  labeling("Trending"),
                  const Sales(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget spacing() => const SizedBox(
        height: 15,
      );
  Widget labeling(String text) => Text(
        text,
        style: font.CustomFonts.labeling,
      );
}
