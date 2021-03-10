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
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: kCardShape,
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Container(
            width: data.size.width / 1.2,
            height: data.size.height / 17,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: FaIcon(icons),
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: data.size.height / 52),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FaIcon(
                    
                    nexticons,
                    size: data.size.width/12,
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
