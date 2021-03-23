import 'package:flutter/material.dart';
import 'constant.dart';
import '../profile/profile.dart';

class EditText extends StatefulWidget {
  static String id = "edit";
  final String newusername;
  final String eemail;
  final String newnumber;

  EditText({this.newusername, this.eemail, this.newnumber});

  @override
  _EditTextState createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  TextEditingController users = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController phone = TextEditingController();

  String username;
  String myemail;
  String number;

  @override
  void initState() {
    super.initState();
    users.text = widget.newusername;
    email.text = widget.eemail;
    phone.text = widget.newnumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        "Username",
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w100,
                          fontFamily: "RoboroM",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      flex: 6,
                      child: TextField(
                          controller: users,
                          onChanged: (values) {
                            username = values;
                          },
                          obscureText: false,
                          textAlign: TextAlign.center,
                          decoration: kEditDecoration.copyWith(
                              hintText: "Enter the username")),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          "Email",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: "RoboroM",
                            letterSpacing: 0.5,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 44.0,
                      ),
                      Flexible(
                        flex: 5,
                        child: TextField(
                            controller: email,
                            onChanged: (value) {
                              myemail = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            textAlign: TextAlign.center,
                            decoration: kEditDecoration.copyWith(
                                hintText: "Enter the email")),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          "Phone Number",
                          style: TextStyle(
                            fontFamily: "RoboroM",
                            letterSpacing: 0.8,
                            fontSize: 16,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 8,
                        child: TextField(
                            controller: phone,
                            onChanged: (values) {
                              number = values;
                            },
                            keyboardType: TextInputType.phone,
                            obscureText: false,
                            textAlign: TextAlign.center,
                            decoration: kEditDecoration.copyWith(
                                hintText: "Enter the phonenumber")),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyProfile(
                                      sname: username,
                                      semail: myemail,
                                      snumber: number,
                                    )));
                      },
                      child: Container(child: Text("Reset"))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
