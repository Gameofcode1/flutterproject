import 'package:flutter/material.dart';
import '../constant.dart';

class ColorSelect extends StatelessWidget {
 final String title;
 final Color color;
  


  ColorSelect({@required this.title,@required this.color});


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 2.0, color: Colors.black45)),
        child: Row(
          children: [
            CircleAvatar(
              radius: 10.0,
              backgroundColor:color,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              title,
              style: kTitle.copyWith(fontWeight: FontWeight.w600),
            )
          ],
        ));
  }
}
