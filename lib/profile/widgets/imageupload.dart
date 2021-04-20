import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:myprofile/profile/profile.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File _image;
  Future getImagefromcamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      MyProfile(simage: _image);

    });
  }

  Future getImagefromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
       MyProfile(simage: _image);
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
          child: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: height /10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GestureDetector(
                    child: Icon(
                      Icons.camera,
                      size: height / 8,
                      color: Colors.black54,
                    ),
                    onTap: getImagefromcamera),
              ),
              Expanded(
                child: GestureDetector(
                    child: Icon(
                      Icons.image,
                      size: height / 8,
                      color: Colors.black54,
                    ),
                    onTap: getImagefromGallery),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
