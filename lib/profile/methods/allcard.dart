import 'package:flutter/material.dart';
import '../widgets/newcard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myprofile/referralcode/refferalcode.dart';
import 'package:myprofile/productDetail/productDetail.dart';
import 'package:myprofile/productadd/productadd.dart';
import 'package:myprofile/SalesForm/formscreen.dart';

class CardColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NewCard(
              icons: FontAwesomeIcons.passport,
              text: "Change Password",
              nexticons: Icons.arrow_forward),
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
                  MaterialPageRoute(builder: (context) => ProductAdd()));
            },
            child: NewCard(
                icons: FontAwesomeIcons.info,
                text: "Help & Support",
                nexticons: Icons.arrow_forward),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Referralcode()));
            },
            child: NewCard(
                icons: FontAwesomeIcons.userFriends,
                text: "Invite Friends",
                nexticons: Icons.arrow_forward),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SlaesForm()));
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
