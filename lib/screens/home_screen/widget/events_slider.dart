import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EventsSlider extends StatelessWidget {
  EventsSlider({Key? key}) : super(key: key);
  final List<String> imgList = [
    'https://s3images.coroflot.com/user_files/individual_files/large_783291_hbz_qswefiwchggq8l8_athzt.jpg',
    'https://thumbs.dreamstime.com/z/flash-sale-banner-lightning-sales-poster-fast-offer-discount-now-offers-deals-vector-illustration-best-promo-marketing-145534110.jpg',
    'https://c8.alamy.com/comp/J46YKJ/summer-sale-vector-web-banner-designs-and-special-offers-for-summer-J46YKJ.jpg',
    'https://www.tatacard.com/tata-card-en/assets/media/images/personal/offers/shopping/eoss/banner-microsite.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWEx4nIk7lzMISGWU8Olgu6moHOFr0-FA78A&usqp=CAU',
    'https://1.bp.blogspot.com/-BljOh9IsaMc/Wv2ut1XzBjI/AAAAAAAABso/2_q74tOAAJ8Be6DWHA8gz4M4hMoC6lB0gCLcBGAs/s1600/728-210-web-banner.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return CarouselSlider.builder(
      itemCount: imgList.length,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      itemBuilder: (ctx, index, realIdx) {
        return ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(imgList[index], fit: BoxFit.fill));
      },
    );
  }
}
