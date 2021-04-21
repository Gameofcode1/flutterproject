import 'package:flutter/material.dart';

class ClickC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.0,
      height: 10.0,
      child: CircleAvatar(
        backgroundColor: Colors.orange[800],
        radius: 10.0,
      ),
    );
  }
}
