import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CommingSoon extends StatefulWidget {
  @override
  _CommingSoonState createState() => _CommingSoonState();
}

class _CommingSoonState extends State<CommingSoon> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: width / 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: height / 40,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextLiquidFill(
                  loadDuration: Duration(seconds: 2),
                  text: 'COMING SOON',
                  waveColor: Colors.orange[700],
                  boxBackgroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: height / 20,
                    fontWeight: FontWeight.bold,
                  ),
                  boxHeight: height / 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
