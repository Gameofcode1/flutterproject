import 'package:flutter/material.dart';
import '../editpage/constant.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: width / 40, right: width / 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: height / 34,
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Container(
                  margin: EdgeInsets.only(top: height / 30, left: width / 30),
                  child: Text(
                    "Reset Password",
                    style: TextStyle(
                        fontSize: height / 40, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height / 15),
                  child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration: kEditDecoration.copyWith(
                      hintText: "Old Password",
                      labelText: "Old Password",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height / 25),
                  child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration: kEditDecoration.copyWith(
                      hintText: "New Password",
                      labelText: "New Password",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height / 25),
                  child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration: kEditDecoration.copyWith(
                      hintText: "New Password",
                      labelText: "New Password",
                    ),
                  ),
                ),
                Center(
                  child: Container(
                      width: double.infinity,
                      height: height / 20,
                      margin: EdgeInsets.only(top: 30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Color(0xffF08626),
                      ),
                      child: Center(
                        child: Text(
                          "Change",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: height / 40),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
