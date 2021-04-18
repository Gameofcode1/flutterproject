import 'package:flutter/material.dart';
import 'package:myprofile/editpage/edit.dart';
import './methods/allcard.dart';
import 'constants.dart';
import 'package:myprofile/notification/notification.dart';

class MyProfile extends StatefulWidget {
  static const String id = 'MyProfile';
  final String sname;
  final String semail;
  final String snumber;
  MyProfile({this.sname, this.semail, this.snumber});

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String username = 'Saugat pudasaini';

  String email = "pudasaini.saugatt@gmail.com";

  String phone = "9845445580";
  bool condition;

  checkname() {
    if (widget.sname == null) {
      return condition = true;
    } else {
      return condition = false;
    }
  }

  checkemail() {
    if (widget.semail == null) {
      return condition = true;
    } else {
      return condition = false;
    }
  }

  checkphone() {
    if (widget.snumber == null) {
      return condition = true;
    } else {
      return condition = false;
    }
  }

  @override
  void initState() {
    super.initState();
    checkname();
    checkemail();
    checkphone();
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: data.size.width / 44, left: data.size.width / 29),
                    child:
                        Icon(Icons.arrow_back_ios, size: data.size.height / 35),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: data.size.width / 44, right: data.size.width / 29),
                    child: IconButton(
                      icon: Icon(Icons.notifications,
                          size: data.size.height / 35),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationSystem()));
                      },
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: data.size.height / 105),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: data.size.height / 65),
                        width: data.size.width / 4,
                        height: data.size.height / 900,
                        color: kActiveIconColor,
                      ),
                      CircleAvatar(
                        radius: data.size.height / 12,
                        backgroundImage: AssetImage(
                          'images/katherine.jpg',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: data.size.height / 65),
                        width: data.size.width / 4,
                        height: data.size.height / 900,
                        color: kActiveIconColor,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: data.size.height / 95),
                child: Text(
                  condition ? username : widget.sname,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "RoboroM",
                    letterSpacing: 1.8,
                    fontSize: data.size.height / 32,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    size: data.size.height / 47,
                  ),
                  SizedBox(width: data.size.width / 73),
                  Text(
                    condition ? email : widget.semail,
                    style: TextStyle(
                      fontFamily: "Roboro",
                      fontSize: data.size.height / 80,
                      letterSpacing: 1.3,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone, size: data.size.height / 47),
                  SizedBox(width: data.size.width / 93),
                  Text(
                    condition ? phone.toString() : widget.snumber,
                    style: TextStyle(
                      fontFamily: "Roboro",
                      fontSize: data.size.height / 86,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: data.size.height / 57),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditText(
                                  newusername: username,
                                  eemail: email,
                                  newnumber: phone,
                                )));
                  },
                  child: Card(
                    elevation: 3.0,
                    shape: kEditshape,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                      ),
                      width: data.size.width / 3,
                      height: data.size.height / 19,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            size: data.size.height / 43,
                            color: kActiveIconColor,
                          ),
                          SizedBox(width: data.size.width / 105),
                          Text(
                            "Edit Profle",
                            style: TextStyle(
                                fontFamily: "RoboroM",
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1.5,
                                fontSize: data.size.height / 62),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              CardColumn()
            ],
          ),
        ),
      ),
    );
  }
}
