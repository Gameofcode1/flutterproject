import 'package:flutter/material.dart';
import '../profile/constants.dart';
import 'constant.dart';
import '../profile/profile.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EditText extends StatefulWidget {
  static String id = "edit";
  final String newusername;
  final String eemail;
  final String newnumber;
  final File checkimage;
  EditText({this.newusername, this.eemail, this.newnumber, this.checkimage});

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
  File _image;

  Future getImagefromcamera() async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
      Navigator.pop(context);
    });
  }

  Future getImagefromGallery() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
      Navigator.pop(context);
    });
  }

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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyProfile(
                                      simage: _image,
                                      sname: username,
                                      semail: myemail,
                                      snumber: number,
                                    )));
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: height / 105),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: height / 65),
                          width: width / 4,
                          height: height / 900,
                          color: kActiveIconColor,
                        ),
                        Stack(overflow: Overflow.visible, children: [
                          Container(
                            child: widget.checkimage == null
                                ? CachedNetworkImage(
                                    imageUrl:
                                        'https://www.pngkey.com/png/detail/349-3499617_person-placeholder-person-placeholder.png',
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    placeholder: (context, url) => CircleAvatar(
                                      backgroundColor: Colors.orange,
                                      radius: height / 12,
                                    ),
                                    imageBuilder: (context, image) =>
                                        CircleAvatar(
                                      backgroundImage: image,
                                      radius: height / 12,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: height / 12,
                                    backgroundImage: _image == null
                                        ? FileImage(widget.checkimage)
                                        : FileImage(_image),
                                  ),
                          ),
                          Positioned(
                            top: height / 8,
                            left: height / 9,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              padding: EdgeInsets.all(2),
                              child: CircleAvatar(
                                radius: height / 50,
                                backgroundColor: Color(0xFFDADADA),
                                child: IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                            BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  topRight:
                                                      Radius.circular(20.0),
                                                ),
                                        ),
                                        context: context,
                                        builder: (context) => Container(
                                              padding: EdgeInsets.all(20.0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  topRight:
                                                      Radius.circular(20.0),
                                                ),
                                              ),
                                              margin: EdgeInsets.only(
                                                  top: height / 40,
                                                  bottom: height / 30),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  5,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: getImagefromcamera,
                                                      child: Container(
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFFDADADA),
                                                                radius:
                                                                    height / 35,
                                                                child: Icon(
                                                                  Icons
                                                                      .photo_camera,
                                                                  size: height /
                                                                      25,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Text(
                                                                "Select From Camera",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        height /
                                                                            50,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(child: SizedBox()),
                                                    GestureDetector(
                                                      onTap:
                                                          getImagefromGallery,
                                                      child: Container(
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  CircleAvatar(
                                                                radius:
                                                                    height / 35,
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFFDADADA),
                                                                child: Icon(
                                                                  Icons.image,
                                                                  size: height /
                                                                      25,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                  "Select From Gallery",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          height /
                                                                              50,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(child: SizedBox())
                                                  ],
                                                ),
                                              ),
                                            ));
                                  },
                                  icon: Icon(Icons.photo_camera),
                                  color: Colors.black87,
                                  iconSize: height / 55,
                                ),
                              ),
                            ),
                          )
                        ]),
                        Container(
                          margin: EdgeInsets.only(top: height / 65),
                          width: width / 4,
                          height: height / 900,
                          color: kActiveIconColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: height / 15),
                      child: TextField(
                        onChanged: (values) {
                          username = values;
                        },
                        obscureText: false,
                        textAlign: TextAlign.left,
                        decoration: kEditDecoration.copyWith(
                          hintText: "UserName",
                          labelText: "UserName",
                        ),
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
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height / 70),
                      child: TextField(
                        onChanged: (values) {
                          number = values;
                        },
                   
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
                        obscureText: false,
                        textAlign: TextAlign.left,
                        decoration: kEditDecoration.copyWith(
                            hintText: "Store Name", labelText: "Store Name"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height / 70),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        textAlign: TextAlign.left,
                        decoration: kEditDecoration.copyWith(
                            hintText: "Store Bio", labelText: "Store Bio"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyProfile(
                              simage: _image,
                              sname: username,
                              semail: myemail,
                              snumber: number,
                            ),
                          ),
                        );
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
                          ),
                        ),
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
