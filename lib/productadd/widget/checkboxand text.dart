import 'package:flutter/material.dart';

class CheckboxText extends StatelessWidget {
  String text;
  bool check;

  CheckboxText({this.check,this.text});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: height / 50),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black38),
                color: check ? Colors.orange[800] : Colors.white,
              ),
              height: height / 40,
              width: width / 15,
              child: Icon(
                Icons.check,
                size: height / 50,
                color: Colors.white,
              )),
          Padding(
            padding: EdgeInsets.only(left: width / 50),
            child: Text(text),
          )
        ],
      ),
    );
  }
}
