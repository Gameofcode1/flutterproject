import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../profile/constants.dart';


class NewCard extends StatelessWidget {
  final IconData icons;
  final String text;
  final IconData nexticons;

  NewCard(
      {@required this.icons, @required this.text, @required this.nexticons});

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Padding(
      padding:  EdgeInsets.all(data.size.height/145,),
      child: Card(
          shape: kCardShape,
          elevation: 1.0,
          child: Padding(
            padding: EdgeInsets.only(top:data.size.height/165),

            child: Container(
              width: data.size.width / 1.2,
                  height: data.size.height / 17,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left:data.size.height/70,top:data.size.height/80,bottom:data.size.height/77 ),
            child: FaIcon(icons,size: data.size.height/52,),
          ),
          Text(
            text,
            style: TextStyle(
               
                fontFamily: "Roboro",
                fontSize: data.size.height / 59,letterSpacing:2,fontWeight: FontWeight.w300),
          ),
          Padding(
            padding: EdgeInsets.only(right:data.size.height/77,top:data.size.height/70,bottom:data.size.height/77 ),
            child: Icon(
              Icons.arrow_forward_ios,
              size: data.size.height/42,
              color: kActiveIconColor,
            ),
          ),
        ],
      ),
            ),
          ),
        ),
    );
  }
}
