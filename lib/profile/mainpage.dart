import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:myprofile/notification/notification.dart';
import 'package:myprofile/productDetail/productDetail.dart';
import 'package:myprofile/profile/profile.dart';
import 'package:myprofile/storeedit/screen/paymentedit.dart';

import 'package:myprofile/storeedit/storeedit.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageindex = 0;

  final MyProfile editpay = MyProfile();

  final NotificationSystem edtpay = NotificationSystem();

  final ProductDetail edpay = ProductDetail();

  final EditPayment pay = EditPayment();

  Widget showpage = new MyProfile();

  _pageChooser(int page) {
    switch (page) {
      case 0:
        return editpay;
        break;
      case 1:
        return edpay;
        break;
      case 2:
        return edtpay;
        break;
      case 3:
        return pay;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          height: height / 13,
          items: <Widget>[
          

            Container(
              height:height/18,
              width: height/19,
            
              child: Stack(children: [
                Padding(
                  padding: pageindex == 0
                      ? EdgeInsets.only(top:height/105, left: height/150)
                      : EdgeInsets.only(top:height/600, left:height/400),
                  child: Icon(Icons.house,
                      size: height / 27,
                      color: pageindex == 0 ? Colors.orange : Colors.black),
                ),
                Positioned(
                    top: height/32,
                    child: Center(
                        child: Visibility(
                            visible: pageindex == 0 ? false : true,
                            child:Text("Bazar",style:TextStyle(fontSize: height/60)),
                            )))
              ]),
            ),
            Container(
              height:height/18,
              width: height/14,
              child: Stack(children: [
                Padding(
                  padding: pageindex == 1
                      ? EdgeInsets.only(top:height/85, left: height/50)
                      : EdgeInsets.only(top:height/300, left:height/60),
                  child: Icon(Icons.add_shopping_cart,
                      size: height / 30,
                      color: pageindex == 1 ? Colors.orange : Colors.black),
                ),
                Positioned(
                   top: height/32,
                    child: Center(
                        child: Visibility(
                            visible: pageindex == 1 ? false : true,
                            child: Text("Shopping",style:TextStyle(fontSize: height/60),))))
              ]),
            ),
           Container(
              height:height/18,
              width: height/19,
              child: Stack(children: [
                Padding(
                  padding: pageindex == 2
                      ? EdgeInsets.only(top:height/90, left: height/95)
                      : EdgeInsets.only(top:height/300, left:height/90),
                  child: Icon(Icons.add_circle,
                      size: height / 33,
                      color: pageindex == 2 ? Colors.orange : Colors.black),
                ),
                Positioned(
                   top: height/34,
                    child: Center(
                        child: Visibility(
                            visible: pageindex == 2 ? false : true,
                            child: Padding(
                              padding: EdgeInsets.only(left: height/75),
                              child: Text("Sell",style:TextStyle(fontSize: height/60),),
                            ))))
              ]),
            ),
            Container(
              height:height/18,
              width: height/14,
              child: Stack(children: [
                Padding(
                  padding: pageindex ==3
                      ? EdgeInsets.only(top:height/90, left: height/50)
                      : EdgeInsets.only(top:height/300, left:height/60),
                  child: Icon(Icons.person_outline,
                      size: height / 30,
                      color: pageindex == 3 ? Colors.orange : Colors.black),
                ),
                Positioned(
                   top: height/32,
                    child: Center(
                        child: Visibility(
                            visible: pageindex == 3 ? false : true,
                            child: Padding(
                              padding: EdgeInsets.only(left: height/100),
                              child: Text("Profile",style:TextStyle(fontSize: height/60),),
                            ))))
              ]),
            ),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInSine,
          animationDuration: Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              pageindex = index;
              showpage = _pageChooser(index);
            });
          },
          letIndexChange: (index) => true,
        ),
        body: SafeArea(child: showpage));
  }
}
