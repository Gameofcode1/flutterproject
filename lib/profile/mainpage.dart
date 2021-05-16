import 'package:flutter/material.dart';
import 'package:myprofile/notification/notification.dart';
import 'package:myprofile/productDetail/productDetail.dart';
import 'package:myprofile/profile/profile.dart';
import 'package:myprofile/storeedit/screen/paymentedit.dart';

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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {
            setState(() {
              pageindex = index;
              showpage = _pageChooser(index);
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: pageindex == 0 ? Colors.orange : Colors.black54,
                ),
                title: Text(
                  "Bazar",
                  style: TextStyle(
                    color: pageindex == 0 ? Colors.orange : Colors.black54,
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: pageindex == 1 ? Colors.orange : Colors.black54,
                ),
                title: Text(
                  "Shopping",
                  style: TextStyle(
                    color: pageindex == 1 ? Colors.orange : Colors.black54,
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle,
                  color: pageindex == 2 ? Colors.orange : Colors.black54,
                ),
                title: Text(
                  "Sell",
                  style: TextStyle(
                    color: pageindex == 2 ? Colors.orange : Colors.black54,
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  color: pageindex == 3 ? Colors.orange : Colors.black54,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(
                    color: pageindex == 3 ? Colors.orange : Colors.black54,
                  ),
                )),
          ],

          // items: <Widget>[
          //   Container(
          //     height: height / 18,
          //     width: height / 19,
          //     child: Stack(children: [
          //       Padding(
          //         padding: pageindex == 0
          //             ? EdgeInsets.only(top: height /400, left: height / 150)
          //             : EdgeInsets.only(top: height / 600, left: height / 400),
          //         child: Icon(Icons.house,
          //             size: height / 27,
          //             color: pageindex == 0 ? Colors.orange : Colors.black45),
          //       ),
          //       Positioned(
          //           top: height / 27,
          //           child: Center(
          //               child:pageindex==0?
          //               Padding(
          //                 padding: EdgeInsets.only(left:height/120),
          //                 child: Text("Bazar",
          //                     style: TextStyle(fontSize: height / 80,color: Colors.black54),),
          //               ):
          //                Text("Bazar",

          //                   style: TextStyle(fontSize: height / 60, color: Colors.black54,))))
          //     ]),
          //   ),
          //   Container(
          //     height: height / 18,
          //     width: height / 14,
          //     child: Stack(children: [
          //       Padding(
          //         padding: pageindex == 1
          //             ? EdgeInsets.only(top: height / 185, left: height / 50)
          //             : EdgeInsets.only(top: height / 160, left: height / 60),
          //         child: Icon(Icons.add_shopping_cart,
          //             size: height / 30,
          //             color: pageindex == 1 ? Colors.orange : Colors.black54),
          //       ),
          //      Positioned(
          //           top: height / 27,
          //           child: Center(
          //               child:pageindex==1?
          //               Padding(
          //                 padding: EdgeInsets.only(left:height/120),
          //                 child: Text("Shopping",
          //                     style: TextStyle(fontSize: height / 80,color: Colors.black45),),
          //               ):
          //                Text("Shopping",
          //                   style: TextStyle(fontSize: height / 60,color: Colors.black54,))))
          //     ]),
          //   ),
          //   Container(
          //     height: height / 18,
          //     width: height / 19,
          //     child: Stack(children: [
          //       Padding(
          //         padding: pageindex == 2
          //             ? EdgeInsets.only(top: height / 120, left: height / 95)
          //             : EdgeInsets.only(top: height /200, left: height / 90),
          //         child: Icon(Icons.add_circle,
          //             size: height / 30,
          //             color: pageindex == 2 ? Colors.orange : Colors.black54),
          //       ),
          //       Positioned(
          //           top: height / 27,
          //           child: Center(
          //               child:pageindex==2?
          //               Padding(
          //                 padding: EdgeInsets.only(left:height/60,top:height/200),
          //                 child: Text("Sell",
          //                     style: TextStyle(fontSize: height / 80,color: Colors.black45),),
          //               ):
          //                Padding(
          //                  padding:EdgeInsets.only(left: height/75,top: height/700),
          //                  child: Text("Sell",
          //                     style: TextStyle(fontSize: height / 60,color: Colors.black54,)),
          //                )))
          //     ]),
          //   ),
          //   Container(
          //     height: height / 18,
          //     width: height / 14,
          //     child: Stack(children: [
          //       Padding(
          //         padding: pageindex == 3
          //             ? EdgeInsets.only(top: height / 200, left: height / 55)
          //             : EdgeInsets.only(top: height / 300, left: height / 60),
          //         child: Icon(Icons.person_outline,
          //             size: height / 27,
          //             color: pageindex == 3 ? Colors.orange : Colors.black54),
          //       ),
          //       Positioned(
          //           top: height / 27,
          //           child: Center(
          //               child:pageindex==3?
          //               Padding(
          //                 padding: EdgeInsets.only(top:height/200,left: height/50),
          //                 child: Text("Profile",
          //                     style: TextStyle(fontSize: height / 80,color: Colors.black45),),
          //               ):
          //                Padding(
          //                  padding:EdgeInsets.only(left: height/105),
          //                  child: Text("Profile",
          //                     style: TextStyle(fontSize: height / 60,color: Colors.black54,)),
          //                )))
          //     ]),
          //   ),
          // ],
          // color: Colors.white,
          // buttonBackgroundColor: Colors.white,
          // backgroundColor: Colors.transparent,
          // animationCurve: Curves.easeInSine,
          // animationDuration: Duration(milliseconds: 500),
          // onTap: (index) {
          //   setState(() {
          //     pageindex = index;
          //     showpage = _pageChooser(index);
          //   });
          // },
          // letIndexChange: (index) => true,
        ),
        body: SafeArea(child: showpage));
  }
}
