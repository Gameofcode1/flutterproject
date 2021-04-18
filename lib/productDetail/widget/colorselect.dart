import 'package:flutter/material.dart';
import '../constant.dart';

class ColorSelect extends StatelessWidget {
 final String title;
 final Color color;


  ColorSelect({@required this.title,@required this.color});


  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.all(height/140),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 1.0, color: Colors.black45)),
        child: Row(
          children: [
            CircleAvatar(
             radius: height/90,
              backgroundColor:color,
            ),
            SizedBox(
              width: width/80,
            ),
            Text(
              title,
              style: kTitle.copyWith(fontWeight: FontWeight.w600,fontSize: height/70),
            )
          ],
        ));
  }
}
