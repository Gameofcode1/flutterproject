import 'package:flutter/material.dart';
import './constant.dart';
import './widgets/invites.dart';

class Referralcode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          
          children: [
            Expanded(
              flex: 15,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(height / 130),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: height / 30,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                        height: height / 3.5,
                        width: double.infinity,
                        child: Image(image: AssetImage('images/bicycle.jpg'))),
                    Text("Text your friend oripari",
                        style:
                            kRefferOfferFont.copyWith(fontSize: height / 26)),
                    Text("app and earn \$100", style: kRefferOfferFont),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height / 60),
                      child: Text("Terms & Conditions",
                          style: kTermsFonts.copyWith(fontSize: height / 60)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 14,
              child: Container(
                decoration: kBoxDecoration,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            margin: EdgeInsets.only(top: height / 40),
                            height: MediaQuery.of(context).size.height / 3,
                            child: InvitesFriends(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                           color: Color(0xffCD6E0F),
                           borderRadius: BorderRadius.circular(10.0)

                        ),
                          width: double.infinity,
                          height: height / 17,
                          margin: EdgeInsets.symmetric(
                              vertical: height / 40, horizontal: width / 20),
                         
                          child: Center(
                            child: Text(
                              "Invites Friends",
                              textAlign: TextAlign.center,
                              style: kRefferOfferFont.copyWith(
                                  fontSize: height /40, color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 0.4),
                            ),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width / 15),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              color: Color(0xffAFAFAF),
                              height: height / 850,
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Center(
                                  child: Text(
                                "or",
                                style: TextStyle(
                                    color: Color(0xff838383),
                                    fontSize: height / 70),
                              ))),
                          Expanded(
                            flex: 4,
                            child: Container(
                              color: Color(0xffAFAFAF),
                              height: height / 850,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height / 50),
                      child: Text(
                        "Share your link",
                        style: TextStyle(
                            fontFamily: 'Robotom',
                            color: Color(0xff838383),
                            fontSize: height / 70),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Container(
                              width: double.infinity,
                              height: height / 17,
                              margin: EdgeInsets.only(
                                  left: width / 18, right: width / 50),
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  "RRTYYSS".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: kRefferOfferFont.copyWith(
                                      fontSize: 25.0,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w300),
                                ),
                              )),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            height: height / 17,
                            margin: EdgeInsets.only(right: width / 18),
                            color: Colors.white,
                            child: Center(
                              child: Icon(
                                Icons.ios_share,
                                color: Color(0xFFf89963),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 30.0, left: width / 18, right: width / 18),
                      color: Color(0xffAFAFAF),
                      height: height / 850,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 50),
                      child: Text(
                        "View Past invites",
                        style: kTermsFonts.copyWith(
                          fontSize: height/60,
                          color: Color(0xffCD6E0F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
