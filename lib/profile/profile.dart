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
                  padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Icon(Icons.arrow_back, size: data.size.width / 9),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                  child: Icon(Icons.store_mall_directory,
                      size: data.size.width / 9),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      width: data.size.width / 4,
                      height: 2.0,
                      color: kActiveIconColor,
                    ),
                    CircleAvatar(
                      radius: data.size.height / 12,
                      backgroundImage: AssetImage(
                        'images/katherine.jpg',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      width: data.size.width / 4,
                      height: 2.0,
                      color: kActiveIconColor,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("New User",
                  style: TextStyle(
                      fontSize: data.size.height / 27,
                      fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email),
                SizedBox(width: data.size.width / 33),
                Text("Pudasaini.saugatt@gmail.com")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                SizedBox(width: data.size.width / 33),
                Text("9845362828")
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18, bottom: 17.0),
              child: Card(
                elevation: 7.0,
                shape: kCardShape,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                  width: data.size.width / 2.5,
                  height: data.size.height / 19,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit),
                      SizedBox(width: data.size.width / 95),
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: data.size.height / 42),
                      )
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
