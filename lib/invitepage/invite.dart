import 'package:flutter/material.dart';
import 'package:myprofile/referralcode/constant.dart';
import 'package:share/share.dart';

class InviteFriens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    const code = "r5j5bbbq";
    var link = "https://staging.oripari.com/user/signup?code=$code";

    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  image: AssetImage("images/intive.jpg"),
                  fit: BoxFit.cover,
                  height: height / 3,
                  width: double.infinity,
                ),
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: height / 34,
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: height / 30),
              child: Text("Share your friend oripari",
                  style: kRefferOfferFont.copyWith(
                      fontSize: height / 32, color: Colors.black54)),
            ),
            Text("app and earn \$100",
                style: kRefferOfferFont.copyWith(
                    fontSize: height / 32, color: Colors.black54)),
            Padding(
              padding: EdgeInsets.only(top: height / 50),
              child: Text("Terms & Conditions",
                  style: TextStyle(
                      fontSize: height / 60,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54)),
            ),
            Container(
              margin: EdgeInsets.only(top: height / 30),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                        width: double.infinity,
                        height: height / 17,
                        margin: EdgeInsets.only(
                            left: width / 18, right: width / 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xffF3F3F3),
                        ),
                        child: Center(
                          child: Text(
                            code.toString(),
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
                    child: GestureDetector(
                      onTap: () {
                        Share.share(link);
                      },
                      child: Container(
                        width: double.infinity,
                        height: height / 17,
                        margin: EdgeInsets.only(right: width / 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xffF3F3F3),
                        ),
                        child: Center(
                          child: GestureDetector(
                              child:
                                  Icon(Icons.ios_share, color: Colors.black45)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height / 50),
              child: Text("Share your link",
                  style: TextStyle(
                      fontSize: height / 60,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54)),
            ),
          ],
        ),
      )),
    );
  }
}
