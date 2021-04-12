import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:myprofile/productDetail/constant.dart';

class ProductAdd extends StatefulWidget {
  @override
  _ProductAddState createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  io.File _image;
  Future getImagefromcamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future getImagefromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    "Product Add",
                    style: TextStyle(fontSize: 19.0),
                  ),
                  SizedBox()
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 18.0, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Photos",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          color: Color(0xffF3F3F3),
                          padding: EdgeInsets.only(
                              top: 35.0, left: 53.0, right: 53.0, bottom: 35.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                            ),
                            onPressed: getImagefromGallery,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10.0),
                            color: Color(0xffF3F3F3),
                            padding: EdgeInsets.only(
                                top: 27.0,
                                left: 37.0,
                                right: 37.0,
                                bottom: 27.0),
                            child: Column(
                              children: [
                                IconButton(
                                    icon: Icon(Icons.add_rounded),
                                    onPressed: getImagefromcamera),
                                Text("Add More")
                              ],
                            ))
                      ],
                    ),
                    FormBuilder(
                      // key: _formkey,
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 18.0, top: 18.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.0, color: Colors.black38)),
                              padding:
                                  EdgeInsets.only(left: 4.0, right: 4, top: 4),
                              child: FormBuilderTextField(
                                name: "Textfield",
                                decoration:
                                    InputDecoration(hintText: "catagoroes"),
                              )),
                          Container(
                              margin: EdgeInsets.only(right: 18.0, top: 8.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.0, color: Colors.black38)),
                              padding:
                                  EdgeInsets.only(left: 4.0, right: 4, top: 4),
                              child: FormBuilderTextField(
                                name: "Textfield",
                                decoration:
                                    InputDecoration(hintText: "ProductTitle"),
                              )),
                          Container(
                              margin: EdgeInsets.only(right: 18.0, top: 8.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.0, color: Colors.black38)),
                              padding:
                                  EdgeInsets.only(left: 4.0, right: 4, top: 4),
                              child: FormBuilderTextField(
                                name: "Textfield",
                                decoration:
                                    InputDecoration(hintText: "Regularform"),
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 17.0),
                            child: Row(
                              children: [
                                Container(
                                    color: Colors.orange[800],
                                    height: 20.0,
                                    width: 20.0,
                                    child: Icon(Icons.check)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("OfferProce"),
                                )
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 18.0, top: 18.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.0, color: Colors.black38)),
                              padding:
                                  EdgeInsets.only(left: 4.0, right: 4, top: 4),
                              child: FormBuilderTextField(
                                name: "Textfield",
                                decoration:
                                    InputDecoration(hintText: "OfferPrice"),
                              )),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    margin:
                                        EdgeInsets.only(right: 18.0, top: 8.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2.0, color: Colors.black38)),
                                    child: FormBuilderTextField(
                                      name: "Textfield",
                                      decoration: InputDecoration(
                                          hintText: "StartDate"),
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    margin:
                                        EdgeInsets.only(right: 18.0, top: 8.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2.0, color: Colors.black38)),
                                    child: FormBuilderTextField(
                                      name: "Textfield",
                                      decoration:
                                          InputDecoration(hintText: "EndDate"),
                                    )),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 17.0),
                            child: Row(
                              children: [
                                Container(
                                    color: Colors.black,
                                    height: 20.0,
                                    width: 20.0,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("Publish"),
                                )
                              ],
                            ),
                          ),
                            Container(
                width: double.infinity,
               
                height: 60.0,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 13.0, bottom: 10.0, left: 130.0, right: 130.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffF2684A),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                          child: Text(
                        "Save",
                        style: kTitleDesc.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ))),
                ),
              )
                        ],
                      ),
                    )
                    // Padding(
                    //   padding: const EdgeInsets.all(16.0),
                    //   child: Container(
                    //     width: MediaQuery.of(context).size.width,
                    //     height: 200.0,
                    //     child: Center(
                    //       child: _image == null
                    //           ? Text("No Image is picked")
                    //           : Image.file(_image),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
