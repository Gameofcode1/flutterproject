import 'package:flutter/material.dart';
import 'package:myprofile/methods/allcard.dart';
import 'constants.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: data.size.width / 44, left: data.size.width / 29),
                  child:
                      Icon(Icons.arrow_back_ios, size: data.size.height / 35),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: data.size.width / 44, right: data.size.width / 29),
                  child: Icon(Icons.store_mall_directory,
                      size: data.size.height / 35),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: data.size.height / 105),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: data.size.height / 65),
                      width: data.size.width / 4,
                      height: data.size.height/900,
                      color: kActiveIconColor,
                    ),
                    CircleAvatar(
                      radius: data.size.height / 12,
                      backgroundImage: AssetImage(
                        'images/katherine.jpg',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: data.size.height / 65),
                      width: data.size.width / 4,
                      height: data.size.height/900,
                      color: kActiveIconColor,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: data.size.height / 95),
              child: Text("New User",
                  style: TextStyle(
                    fontFamily: "RoboroM",
                    letterSpacing: 1.8,
                    fontSize: data.size.height / 32,
                    fontWeight: FontWeight.w100,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email,
                  size: data.size.height / 47,
                ),
                SizedBox(width: data.size.width / 73),
                Text(
                  "theNewusers@gmail.com",
                  style: TextStyle(
                    fontFamily: "Roboro",
                    fontSize: data.size.height / 80,
                    letterSpacing: 1.3,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone, size: data.size.height / 47),
                SizedBox(width: data.size.width /93),
                Text("9090909090",
                    style: TextStyle(
                      fontFamily: "Roboro",
                      fontSize: data.size.height / 86,
                      letterSpacing: 1.2,
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: data.size.height / 95, bottom: data.size.height / 37),
              child: Card(
                elevation: 3.0,
                shape: kEditshape,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                  width: data.size.width / 3,
                  height: data.size.height / 19,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        size: data.size.height / 43,
                        color: kActiveIconColor,
                      ),
                      SizedBox(width: data.size.width / 105),
                      Text(
                        "Edit Profle",
                        style: TextStyle(
                            fontFamily: "RoboroM",
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.5,
                            fontSize: data.size.height / 62),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CardColumn()
          ],
        )),
      ),
    );
  }
}
