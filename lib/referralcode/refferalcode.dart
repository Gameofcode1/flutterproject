import 'package:flutter/material.dart';
import './constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Referralcode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios),
                        )
                      ],
                    ),
                    Container(
                        height: 250.0,
                        width: double.infinity,
                        child: Image(image: AssetImage('images/bicycle.jpg'))),
                    Text("Text your friend oripari", style: kRefferOfferFont),
                    Text("app and earn \$25", style: kRefferOfferFont),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text("Terms & Conditions", style: kTermsFonts),
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
                            margin: EdgeInsets.only(top: 30.0),
                            height: MediaQuery.of(context).size.height / 3,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      child: Text("Invites friends",
                                          style: kRefferOfferFont)),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    decoration: kNBoxDecoration,
                                    child: Row(
                                      children: [
                                        Expanded(child: SizedBox()),
                                        Expanded(
                                            child: FaIcon(FontAwesomeIcons
                                                .facebook,size: 40.0,)),
                                        Expanded(
                                            child: FaIcon(FontAwesomeIcons
                                                .facebookMessenger,size: 40.0)),
                                        Expanded(
                                            child: FaIcon(FontAwesomeIcons
                                                .instagram,size: 40.0)),
                                        Expanded(
                                            child: FaIcon(FontAwesomeIcons
                                                .whatsapp,size: 40.0)),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 25.0, horizontal: 30.0),
                                      color: Color(0xffCD6E0F),
                                      child: Center(
                                        child: Text(
                                          "Invites Friends",
                                          textAlign: TextAlign.center,
                                          style: kRefferOfferFont.copyWith(
                                              fontSize: 25.0,
                                              color: Colors.white),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                          width: double.infinity,
                          height: 50.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 30.0),
                          color: Color(0xffCD6E0F),
                          child: Center(
                            child: Text(
                              "Invites Friends",
                              textAlign: TextAlign.center,
                              style: kRefferOfferFont.copyWith(
                                  fontSize: 25.0, color: Colors.white),
                            ),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              color: Color(0xffAFAFAF),
                              height: 1.0,
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Center(
                                  child: Text(
                                "or",
                                style: TextStyle(
                                  color: Color(0xff838383),
                                ),
                              ))),
                          Expanded(
                            flex: 4,
                            child: Container(
                              color: Color(0xffAFAFAF),
                              height: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Share your link",
                        style: TextStyle(
                          fontFamily: 'Robotom',
                          color: Color(0xff838383),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Container(
                              width: double.infinity,
                              height: 50.0,
                              margin: EdgeInsets.only(left: 30.0, right: 10.0),
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
                            height: 50.0,
                            margin: EdgeInsets.only(right: 25.0),
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
                      margin: EdgeInsets.only(top: 30.0, left: 25, right: 25),
                      color: Color(0xffAFAFAF),
                      height: 1.0,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: Text("View Past invites",
                          style: kTermsFonts.copyWith(
                            fontSize: 15.0,
                            color: Color(0xffCD6E0F),
                          )),
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

  widget({FaIcon child}) {}
}
