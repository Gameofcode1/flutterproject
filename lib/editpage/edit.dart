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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: width / 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: height / 34,
                          color: Colors.black87,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(),
                    IconButton(
                        icon: Icon(
                          Icons.done,
                          size: height / 25,
                          color: Color(0xffF08626),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: height / 550, bottom: height / 20),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      CircleAvatar(
                          backgroundImage: AssetImage("images/katherine.jpg"),
                          radius: height / 11),
                      Positioned(
                        top: height / 8,
                        left: width / 3.5,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.all(2),
                          child: CircleAvatar(
                            radius: height / 50,
                            backgroundColor:Color(0xffF08626),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: height / 38,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Username",
                        style: kTextStyle.copyWith(fontSize: height / 50)),
                    Container(
                     
                      margin: EdgeInsets.only(top: height / 160),
                      child: TextField(
                        controller: users,
                        onChanged: (values) {
                          username = values;
                        },
                        obscureText: false,
                        textAlign: TextAlign.left,
                        decoration: kEditDecoration.copyWith(
                            hintText: "Enter the username"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height / 80),
                      child: Text("Email",
                          textAlign: TextAlign.start,
                          style: kTextStyle.copyWith(fontSize: height / 50)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height / 160),
                     
                      child: TextField(
                          controller: email,
                          onChanged: (value) {
                            myemail = value;
                          },
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          textAlign: TextAlign.left,
                          decoration: kEditDecoration.copyWith(
                              hintText: "Enter the email")),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height / 80),
                      child: Text("Phone Number",
                          style: kTextStyle.copyWith(fontSize: height / 50)),
                    ),
                    Container(
                      
                      margin: EdgeInsets.only(top: height / 160),
                      child: TextField(
                        controller: phone,
                        onChanged: (values) {
                          number = values;
                        },
                        keyboardType: TextInputType.phone,
                        obscureText: false,
                        textAlign: TextAlign.left,
                        decoration: kEditDecoration.copyWith(
                            hintText: "Enter the phonenumber"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height / 80),
                      child: Text("Store Name *",
                          style: kTextStyle.copyWith(fontSize: height / 50)),
                    ),
                    Container(
                     
                      margin: EdgeInsets.only(top: height / 160),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        textAlign: TextAlign.left,
                        decoration: kEditDecoration.copyWith(
                            hintText: "Enter the Store name"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height / 80),
                      child: Text("About Store *",
                          style: kTextStyle.copyWith(fontSize: height / 50)),
                    ),
                    Container(
                     
                      margin: EdgeInsets.only(top: height / 160),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        textAlign: TextAlign.left,
                        decoration: kEditDecoration.copyWith(
                            hintText: "Short bio on store"),
                      ),
                    ),
                    TextButton(
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
                      child: Center(
                        child: Container(
                            margin: EdgeInsets.only(top: 30.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color(0xffF08626),
                            ),
                            padding: EdgeInsets.only(
                                left: width / 15,
                                right: width / 15,
                                top: height / 70,
                                bottom: height / 70),
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                  color: Colors.white, fontSize: height / 55),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
