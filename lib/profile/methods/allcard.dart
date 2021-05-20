import 'package:flutter/material.dart';

import '../widgets/newcard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myprofile/productDetail/productDetail.dart';
import 'package:myprofile/InroductionScreen/introduction.dart';
import "package:myprofile/storeedit/storeedit.dart";
import 'package:myprofile/invitepage/invite.dart';
import 'package:myprofile/productadd/productadd.dart';

import 'package:myprofile/changepassword/changepassword.dart';

class CardColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChangePassword()));
            },
            child: NewCard(
                icons: FontAwesomeIcons.passport,
                text: "Change Password",
                nexticons: Icons.arrow_forward),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductDetail()));
            },
            child: NewCard(
                icons: FontAwesomeIcons.history,
                text: "Purchases History",
                nexticons: Icons.arrow_forward),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InviteFriens()));
            },
            child: NewCard(
                icons: FontAwesomeIcons.info,
                text: "Help & Support",
                nexticons: Icons.arrow_forward),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StoreEdit()));
            },
            child: NewCard(
                icons: FontAwesomeIcons.userFriends,
                text: "Invite Friends",
                nexticons: Icons.arrow_forward),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductAdd()));
            },
            child: NewCard(
                icons: FontAwesomeIcons.signOutAlt,
                text: "Logout",
                nexticons: Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
