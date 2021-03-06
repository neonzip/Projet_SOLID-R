import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

/// https://www.coderzheaven.com/2019/04/22/carousel-in-flutter/
class CarouselPictures extends StatefulWidget {
  const CarouselPictures({Key? key}) : super(key: key);

  @override
  CarouselPicturesState createState() => CarouselPicturesState();
}

class CarouselPicturesState extends State<CarouselPictures> {
  //
  late CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'assets/background.png',
    'assets/background.png',
    'assets/background.png',
    'assets/background.png',
    'assets/background.png',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            carouselSlider = CarouselSlider(
              items: imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Image.asset(
                        imgUrl,
                        fit: BoxFit.fill,
                      ),
                      /*child: Image.network(
                        imgUrl,
                        fit: BoxFit.fill,
                      ),*/
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 200.0,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: true,
                reverse: false,
                enableInfiniteScroll: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                pauseAutoPlayOnTouch: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 5.0,
                  height: 5.0,
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? const Color(0xFF0725A5) : const Color(0x2A0725A5),
                  ),
                );
              }),
            ),
          ],
        )
    );
  }
}