import 'package:flutter/material.dart';

class SelectImages extends StatefulWidget {
  final Function getImagefromcamera;
  final Function getImagefromGallery;

  SelectImages({this.getImagefromGallery, this.getImagefromcamera});

  @override
  _SelectImagesState createState() => _SelectImagesState();
}

class _SelectImagesState extends State<SelectImages> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
   
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      margin: EdgeInsets.only(top: height / 40, bottom: height / 30),
      height: MediaQuery.of(context).size.height / 5,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: widget.getImagefromcamera,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFDADADA),
                        radius: height / 35,
                        child: Icon(
                          Icons.photo_camera,
                          size: height / 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Select From Camera",
                        style: TextStyle(
                            fontSize: height / 50, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            GestureDetector(
              onTap: widget.getImagefromGallery,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: CircleAvatar(
                        radius: height / 35,
                        backgroundColor: Color(0xFFDADADA),
                        child: Icon(
                          Icons.image,
                          size: height / 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          "Select From Gallery",
                          style: TextStyle(
                              fontSize: height / 50,
                              fontWeight: FontWeight.w400),
                        )),
                  ],
                ),
              ),
            ),
            Expanded(child: SizedBox())
          ],
        ),
      ),
    );
  }
}
