import 'package:flutter/material.dart';

class SimpleC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.0,
      height: 10.0,
      child: CircleAvatar(
        backgroundColor: Color(0xffC4C4C4),
        radius: 10.0,
      ),
    );
  }
}