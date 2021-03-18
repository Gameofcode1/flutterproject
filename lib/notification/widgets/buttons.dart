import 'package:flutter/material.dart';
import '../constant.dart';
class NewButton extends StatelessWidget {
 
  final String titlee;
  NewButton({this.titlee});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(titlee,
            style: kNotification.copyWith(
                fontSize: 10.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 0,
                color: Colors.white)));
  }
}
