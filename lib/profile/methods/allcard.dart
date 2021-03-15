import 'package:flutter/material.dart';
import '../widgets/newcard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CardColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
         NewCard(
                icons:FontAwesomeIcons.passport , text: "Change Password", nexticons: Icons.arrow_forward),
            NewCard(
                icons: FontAwesomeIcons.history, text: "Purchases History", nexticons: Icons.arrow_forward),
            NewCard(
                icons: FontAwesomeIcons.info, text: "Help & Support", nexticons: Icons.arrow_forward),
            NewCard(
                icons: FontAwesomeIcons.userFriends, text: "Invite Friends", nexticons: Icons.arrow_forward),
                 NewCard(
                icons:  FontAwesomeIcons.signOutAlt, text: "Logout", nexticons:Icons.arrow_forward),
      ],),
      
    );
  }
}