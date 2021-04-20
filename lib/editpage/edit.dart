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
                            backgroundColor: Color(0xffF08626),
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
                    Container(
                      margin: EdgeInsets.only(top: height / 70),
                      child: TextField(
                        onChanged: (values) {
                          username = values;
                        },
                        obscureText: false,
                        textAlign: TextAlign.left,
                        decoration: kEditDecoration.copyWith(
                            hintText: "UserName",
                            labelText: "UserName",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height / 70),
                      child: TextField(
                          onChanged: (value) {
                            myemail = value;
                          },
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.left,
                          decoration: kEditDecoration.copyWith(
                              hintText: "Email",
                              labelText: "Email",
                              border: OutlineInputBorder())),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height / 70),
                      child: TextField(
                        onChanged: (values) {
                          number = values;
                        },
                        keyboardType: TextInputType.phone,
                        obscureText: false,
                        textAlign: TextAlign.left,
                        decoration: kEditDecoration.copyWith(
                            hintText: "Phone number",
                            labelText: "Phone Number",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height / 70),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        textAlign: TextAlign.left,
                        decoration: kEditDecoration.copyWith(
                            hintText: "Store Name",
                            border: OutlineInputBorder(),
                            labelText: "Store Name"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height / 70),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        textAlign: TextAlign.left,
                        decoration: kEditDecoration.copyWith(
                            hintText: "Store Bio",
                            border: OutlineInputBorder(),
                            labelText: "Store Bio"),
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
                            width: double.infinity,
                            height: height / 20,
                            margin: EdgeInsets.only(top: 30.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color(0xffF08626),
                            ),
                            child: Center(
                              child: Text(
                                "Change",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: height / 40),
                              ),
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
