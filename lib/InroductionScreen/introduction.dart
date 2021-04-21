import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'pages/pages.dart';
import './widget/clickcircle.dart';
import './widget/simplecircle.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int currentindex = 0;
  CarouselSlider carouselSlider;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Expanded(
            flex: 6,
                      child: Container(
              child: Column(
             
                children: [
                  CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentindex = index;
                          });
                        },
                       height: height/1.2,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 1,
                      ),
                      items: images),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Skip"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: images.map((url) {
                              int index = images.indexOf(url);
                              return Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  child: currentindex == index
                                      ? ClickC()
                                      : SimpleC());
                            }).toList(),
                          ),
                          Text("Next")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
