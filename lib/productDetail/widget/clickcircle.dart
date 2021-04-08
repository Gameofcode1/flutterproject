import 'package:flutter/material.dart';

class ClickCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: CircleAvatar(
          backgroundColor: Color(0xff4F4F4F),
          radius: 30.0,
        ),
      ),
    );
  }
}
