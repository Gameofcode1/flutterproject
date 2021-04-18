import 'package:flutter/material.dart';

class ClickCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/18,
      height: MediaQuery.of(context).size.height/39,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white),
      child: Padding(
        padding:  EdgeInsets.all( MediaQuery.of(context).size.height/300),
        child: CircleAvatar(
          backgroundColor: Color(0xff4F4F4F),
         
        ),
      ),
    );
  }
}
