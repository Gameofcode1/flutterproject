import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'constant.dart';
import './widget/clickcircle.dart';
import './widget/colorselect.dart';
import './widget/containertext.dart';
import './models/list.dart';
import 'widget/productdetaldes.dart';
import './widget/simplecircle.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int currentindex = 0;
  CarouselSlider carouselSlider;

@override
  void initState() {
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

     final productData=Provider.of<Allimage>(context);
    final product=productData.images;

    final allproduct=productData.addcata;

    

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, size: height / 35),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.all(width / 25),
                        child: Row(
                          children: [
                            Icon(Icons.favorite_rounded, size: height / 35),
                            SizedBox(
                              width: width / 60,
                            ),
                            Icon(Icons.share, size: height / 35)
                          ],
                        ),
                      ),
                    ],
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                
                CarouselSlider(
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentindex = index;
                        });
                      },
                      height: height / 4.5,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 1,
                    ),
                    items: product),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            Row(            
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: allproduct.map<Widget>((url) {
                              int index = allproduct.indexOf(url);
                              return  Padding(
                            padding: EdgeInsets.only(left: width / 20),
                            child: Text(
                              allproduct[index],
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: height / 70,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.left,
                            ),
                          );
                            }).toList(),
                          ),
                          SizedBox(
                            width: width / 4,
                          ),
                          Row(
                            
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: product.map<Widget>((url) {
                              int index = product.indexOf(url);
                              return Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  child: currentindex == index
                                      ? ClickCircle()
                                      : SimpleCirsle());
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ContainerText(),
                Productdetaildes(),
                Container(
                  margin: EdgeInsets.only(left: width / 20),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Padding(
                              padding: EdgeInsets.all(width / 100),
                              child: ColorSelect(
                                  color: Colors.red, title: "Red"))),
                      Expanded(
                        flex: 2,
                        child: Padding(
                            padding: EdgeInsets.all(width / 100),
                            child: ColorSelect(
                              color: Colors.orange,
                              title: "Orange",
                            )),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                            padding: EdgeInsets.all(width / 100),
                            child: ColorSelect(
                                title: "Green", color: Colors.green)),
                      ),
                      Expanded(flex: 1, child: SizedBox())
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width / 20.0, top: height / 50),
                  child: Text(
                    "Sold By",
                    style: kTitleDesc.copyWith(
                        fontSize: height / 50, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width / 20, top: height / 140),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xffF3F3F3),
                        radius: height / 50,
                      ),
                      SizedBox(
                        width: width / 40,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sold By",
                            style: kTitleDesc.copyWith(
                                fontSize: height / 55,
                                fontWeight: FontWeight.w800),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height / 200),
                            child: Text(
                              "4km away -durbarmagh, kathmandu",
                              style: kTitleDesc.copyWith(
                                  fontWeight: FontWeight.w300,
                                  fontSize: height / 70),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height / 200),
                            child: Text(
                              "Verified",
                              style: kTitleDesc.copyWith(
                                  fontSize: height / 70,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.green),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height / 70),
                            child: Text(
                              "Payment Accepted",
                              style: kTitleDesc.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: height / 70),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: height / 170),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image(
                                    image: AssetImage(
                                      "images/esawa.jpg",
                                    ),
                                    height: height / 40,
                                    width: width / 20,
                                  ),
                                ),
                                Text(
                                  "Sawa",
                                  style: kTitleDesc.copyWith(
                                      fontSize: height / 50),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Container(
                                    height: height / 40,
                                    width: width / 8,
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
                  height: height / 13,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: height / 70,
                        bottom: height / 70,
                        left: width / 5,
                        right: width / 5),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffF2684A),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                            child: Text(
                          "Chat With Seller",
                          style: kTitleDesc.copyWith(
                              color: Colors.white, fontSize: height / 50),
                          textAlign: TextAlign.center,
                        ))),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
