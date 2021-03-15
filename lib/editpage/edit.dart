
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
void initState(){
  super.initState();
  users.text = widget.newusername;
  email.text=widget.eemail;
  phone.text=widget.newnumber;
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: 13.0),
                  child: Text(
                "Username",
                style: TextStyle(
                  fontFamily: "RoboroM",
                  letterSpacing: 1.8,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w100,
                ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontFamily: "RoboroM",
                      letterSpacing: 1.8,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: email,
                      onChanged: (value) {
                        myemail = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      textAlign: TextAlign.center,
                      decoration:
                          kEditDecoration.copyWith(hintText: "Enter the email")),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Center(
                      child: Text(
                    "Phone Number",
                    style: TextStyle(
                      fontFamily: "RoboroM",
                      letterSpacing: 1.8,
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
