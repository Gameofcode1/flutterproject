import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myprofile/editpage/edit.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import './methods/allcard.dart';
import 'constants.dart';
import 'package:myprofile/notification/notification.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyProfile extends StatefulWidget {
  static const String id = 'MyProfile';
  final String sname;
  final String semail;
  final String snumber;
  final File simage;
  MyProfile({this.sname, this.semail, this.snumber, this.simage});

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

  image() {
    _image = widget.simage;
  }

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
    checkname();
    checkemail();
    checkphone();
    image();
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    var height = MediaQuery.of(context).size.height;

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
                      Stack(overflow: Overflow.visible, children: [
                        Container(
                          child: _image != null
                              ? CircleAvatar(
                                  radius: data.size.height / 12,
                                  backgroundImage: FileImage(_image))
                              : CachedNetworkImage(
                                  imageUrl:
                                      'https://www.pngkey.com/png/detail/349-3499617_person-placeholder-person-placeholder.png',
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  placeholder: (context, url) => CircleAvatar(
                                    backgroundColor: Colors.orange,
                                    radius: data.size.height / 12,
                                  ),
                                  imageBuilder: (context, image) =>
                                      CircleAvatar(
                                    backgroundImage: image,
                                    radius: data.size.height / 12,
                                  ),
                                ),
                        ),
                        Positioned(
                          top: data.size.height / 8,
                          left: data.size.height / 9,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: data.size.height / 50,
                              backgroundColor: Color(0xFFDADADA),
                              child: IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      context: context,
                                      builder: (context) => Container(
                                            padding: EdgeInsets.all(20.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                              ),
                                            ),
                                            margin: EdgeInsets.only(
                                                top: data.size.height / 40,
                                                bottom: data.size.height / 30),
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
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFFDADADA),
                                                              radius:
                                                                  height / 35,
                                                              child: Icon(
                                                                Icons
                                                                    .photo_camera,
                                                                size:
                                                                    height / 25,
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
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(child: SizedBox()),
                                                  GestureDetector(
                                                    onTap: getImagefromGallery,
                                                    child: Container(
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: CircleAvatar(
                                                              radius:
                                                                  height / 35,
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFFDADADA),
                                                              child: Icon(
                                                                Icons.image,
                                                                size:
                                                                    height / 25,
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
                                iconSize: data.size.height / 50,
                              ),
                            ),
                          ),
                        )
                      ]),
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
                          checkimage: _image,
                        ),
                      ),
                    );
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
                            color: Colors.black87,
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
