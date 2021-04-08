import 'package:flutter/material.dart';
import "../constant.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InvitesFriends extends StatelessWidget {
  const InvitesFriends({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Text(
              "Invites friends",
              style: kRefferOfferFont.copyWith(),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(
                left: width / 15,
                right: width / 15,
                top: height / 90,
                bottom: height / 90),
            decoration: kNBoxDecoration,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: SizedBox()),
                Expanded(
                    child: FaIcon(
                  FontAwesomeIcons.facebook,
                  size: height / 17,
                )),
                Expanded(
                    child: FaIcon(
                  FontAwesomeIcons.facebookMessenger,
                  size: height / 17,
                )),
                Expanded(
                    child: FaIcon(
                  FontAwesomeIcons.instagram,
                  size: height / 17,
                )),
                Expanded(
                    child: FaIcon(
                  FontAwesomeIcons.whatsapp,
                  size: height / 17,
                )),
                Expanded(child: SizedBox())
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
              width: double.infinity,
              height: 50.0,
              margin: EdgeInsets.symmetric(
                  vertical: height / 35, horizontal: width / 13),
              color: Color(0xffCD6E0F),
              child: Center(
                child: Text(
                  "Invites Friends",
                  textAlign: TextAlign.center,
                  style: kRefferOfferFont.copyWith(
                      fontSize: height / 50, color: Colors.white),
                ),
              )),
        ),
      ],
    );
  }
}
