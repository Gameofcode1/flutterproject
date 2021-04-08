import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'constant.dart';
import './widget/clickcircle.dart';
import './widget/colorselect.dart';
import './widget/containertext.dart';
import './models/list.dart';
import 'widget/productdetaldes.dart';
import './widget/simplecircle.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int currentindex = 0;
  CarouselSlider carouselSlider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentindex = index;
                      });
                    },
                    height: 250.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                  items: images),
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Cloathing>men>Shoe',
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: images.map((url) {
                              int index = images.indexOf(url);
                              return Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  child: currentindex == index
                                      ? ClickCircle()
                                      : SimpleCirsle());
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ContainerText(),
              Productdetaildes(),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                ColorSelect(color: Colors.red, title: "Red"))),
                    Expanded(
                      flex: 2,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ColorSelect(
                            color: Colors.orange,
                            title: "Orange",
                          )),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              ColorSelect(title: "Green", color: Colors.green)),
                    ),
                    Expanded(flex: 1, child: SizedBox())
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Sold By",
                  style: kTitleDesc.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0, top: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xffF3F3F3),
                      radius: 20.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sold By",
                          style: kTitleDesc.copyWith(
                              fontSize: 17, fontWeight: FontWeight.w800),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text(
                            "4km away -durbarmagh, kathmandu",
                            style: kTitleDesc.copyWith(
                                fontWeight: FontWeight.w300, fontSize: 15.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Verified",
                            style: kTitleDesc.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: Colors.green),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Payment Accepted",
                            style: kTitleDesc.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 15.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  child: Image(
                                image: AssetImage(
                                  "images/esawa.jpg",
                                ),
                                height: 23.0,
                                width: 25.0,
                              )),
                              Text(
                                "Sawa",
                                style: kTitleDesc,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Container(
                                  height: 25.0,
                                  width: 50.0,
                                  child: Image(
                                      image: AssetImage(
                                    "images/fonepay.png",
                                  ))),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Color(0xffF3F3F3),
                height: 60.0,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 100.0, right: 100.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffF2684A),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                          child: Text(
                        "Chat With Seller",
                        style: kTitleDesc.copyWith(color: Colors.white),textAlign: TextAlign.center,
                      ))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
