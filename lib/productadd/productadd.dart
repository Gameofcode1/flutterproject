import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:myprofile/productDetail/constant.dart';
import 'package:myprofile/productadd/categorypages/categorypages.dart';
import 'package:myprofile/productadd/models/titles.dart';
import 'package:provider/provider.dart';
import 'package:myprofile/productDetail/models/list.dart';
import './Listproduct/list.dart';
import './widget/addimages.dart';

import './widget/checkboxand text.dart';

class ProductAdd extends StatefulWidget {
  @override
  _ProductAddState createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> with ChangeNotifier {
  File _image;
  bool checkbox = false;
  bool seccheckbox = false;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  Future getImagefromcamera() async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
      Provider.of<Allimage>(context, listen: false).imageadd(_image);
      Navigator.pop(context);
    });
  }

  Future getImagefromGallery() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
      Provider.of<Allimage>(context, listen: false).imageadd(_image);
      Navigator.pop(context);
    });
  }

  Future<void> _startDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != startDate)
      setState(() {
        startDate = pickedDate;
      });
  }

  Future<void> _endDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: endDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != endDate)
      setState(() {
        endDate = pickedDate;
      });
  }

  bool iconclick = false;
  List<Titles> newdata = List.from(catagorie);
  List<String> data = images.keys.toList();
  List<String> search = ["sun"];

  onitemchanged(String value) {
    setState(() {
      newdata = catagorie
          .where((string) =>
              string.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  onvaluechanged(String value) {
    setState(() {
      search = data
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final image = Provider.of<Allimage>(context);
    final allimages = image.images;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: width / 30),
          child: ListView(
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
                    style: TextStyle(fontSize: height / 40),
                  ),
                  SizedBox()
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: width / 40, top: height / 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: height / 50),
                      child: Text(
                        "Photos",
                        style: TextStyle(fontSize: height / 50),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          allimages.length > 0
                              ? Expanded(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: height / 9,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          physics: ScrollPhysics(),
                                          itemCount: allimages.length + 1,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return index == allimages.length
                                                ? Container(
                                                    margin: EdgeInsets.only(
                                                        left: width / 90),
                                                    height: height / 10,
                                                    width: width / 5,
                                                    decoration: BoxDecoration(
                                                      border:
                                                          Border.all(width: 1),
                                                    ),
                                                    child: GestureDetector(
                                                        child: Icon(
                                                          Icons
                                                              .add_photo_alternate,
                                                          size: height / 30,
                                                        ),
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20.0),
                                                                ),
                                                              ),
                                                              context: context,
                                                              builder:
                                                                  (context) =>
                                                                      AddImages(
                                                                        getImagefromGallery:
                                                                            () {
                                                                          getImagefromGallery();
                                                                        },
                                                                        getImagefromcamera:
                                                                            () {
                                                                          getImagefromcamera();
                                                                        },
                                                                      ));
                                                        }),
                                                  )
                                                : Stack(
                                                    overflow: Overflow.visible,
                                                    children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                      width:
                                                                          1.0)),
                                                          width: width / 5,
                                                          height: height / 9,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 4.0),
                                                          child:
                                                              allimages[index],
                                                        ),
                                                        Positioned(
                                                          bottom: height / 11,
                                                          right: height / 14,
                                                          child: InkWell(
                                                            highlightColor:
                                                                Colors.black,
                                                            onTap: () {
                                                              setState(() {
                                                                image.deleteTask(
                                                                    allimages[
                                                                        index]);
                                                              });
                                                            },
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.orange,
                                                              radius:
                                                                  height / 90,
                                                              child: Icon(
                                                                Icons.clear,
                                                                size:
                                                                    height / 70,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]);
                                          })))
                              : Container(
                                  height: height / 10,
                                  width: width / 5,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                  ),
                                  child: GestureDetector(
                                      child: Icon(
                                        Icons.add_photo_alternate,
                                        size: height / 30,
                                      ),
                                      onTap: () {
                                        showModalBottomSheet(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                              ),
                                            ),
                                            context: context,
                                            builder: (context) => AddImages(
                                                  getImagefromGallery: () {
                                                    getImagefromGallery();
                                                  },
                                                  getImagefromcamera: () {
                                                    getImagefromcamera();
                                                  },
                                                ));
                                      }),
                                ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: image.addcata.map<Widget>((url) {
                          int index = image.addcata.indexOf(url);
                          return Stack(
                            children: [
                              Card(
                                margin: EdgeInsets.only(
                                    top: height / 60, right: width / 90),
                                elevation: 1,
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: height / 400,
                                        horizontal: width / 20),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: height / 100,
                                          horizontal: width / 70),
                                      child: Text(
                                        image.addcata[index],
                                        style: TextStyle(fontSize: height / 80),
                                      ),
                                    )),
                              ),
                              Positioned(
                                bottom: height / 40,
                                left: width / 300,
                                child: InkWell(
                                  highlightColor: Colors.black,
                                  onTap: () {
                                    setState(() {
                                      image.deletecat(image.addcata[index]);
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.orange,
                                    radius: height / 90,
                                    child: Icon(
                                      Icons.clear,
                                      size: height / 70,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    FormBuilder(
                      // key: _formkey,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: width / 40, top: height / 100),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: Colors.black38)),
                            padding: EdgeInsets.only(
                                top: height / 200, left: width / 40),
                            child: FormBuilderTextField(
                              onTap: () {
                                setState(() {
                                  iconclick = !iconclick;
                                });
                              },
                              name: "Textfield",
                              onChanged: onitemchanged,
                              decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          iconclick = !iconclick;
                                        });
                                      },
                                      child: Icon(
                                        Icons.expand_more,
                                        color: Colors.black,
                                      )),
                                  hintText: "Select Category",
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                            ),
                          ),
                          iconclick == true
                              ? Container(
                                  margin: EdgeInsets.only(
                                      right: width / 40, top: height / 100),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  width: double.infinity,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Color(0xffF3F3F3),
                                    ),
                                    margin: EdgeInsets.only(
                                        left: width / 50, top: height / 100),
                                    child: Column(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: newdata.map<Widget>((url) {
                                            int index = newdata.indexOf(url);

                                            return TextButton(
                                              onPressed: () {
                                                 Navigator.of(context).pushNamed(CategoryPages.routeName,arguments: newdata[index].id);
                                              },
                                              child: Text(
                                                newdata[index].name,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: height / 60,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
                          Container(
                            margin: EdgeInsets.only(
                                right: width / 40, top: height / 100),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: Colors.black38)),
                            padding: EdgeInsets.only(
                                top: height / 200, left: width / 40),
                            child: FormBuilderTextField(
                              name: "Textfield",
                              decoration: InputDecoration(
                                  hintText: "Product Title",
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                right: width / 40, top: height / 100),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: Colors.black38)),
                            padding: EdgeInsets.only(
                                top: height / 200, left: width / 40),
                            child: FormBuilderTextField(
                              name: "Textfield",
                              decoration: InputDecoration(
                                  hintText: "Regularform",
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  checkbox = !checkbox;
                                });
                              },
                              child: CheckboxText(
                                check: checkbox,
                                text: "Offer Price",
                              )),
                          Container(
                            margin: EdgeInsets.only(
                                right: width / 40, top: height / 100),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: Colors.black38)),
                            padding: EdgeInsets.only(
                                top: height / 200, left: width / 40),
                            child: FormBuilderTextField(
                              name: "Textfield",
                              decoration: InputDecoration(
                                  hintText: "Regular Price",
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                            ),
                          ),
                          Row(children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: width / 40, top: height / 100),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0, color: Colors.black38)),
                                padding: EdgeInsets.only(
                                    top: height / 200, left: width / 40),
                                child: FormBuilderTextField(
                                  name: "Textfield",
                                  decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                          onTap: () => _startDate(context),
                                          child: Icon(
                                            Icons.calendar_today_rounded,
                                            color: Colors.black,
                                          )),
                                      hintText: startDate.year.toString() +
                                          "/" +
                                          startDate.month.toString() +
                                          "/" +
                                          startDate.day.toString(),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: width / 40, top: height / 100),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0, color: Colors.black38)),
                                padding: EdgeInsets.only(
                                    top: height / 200, left: width / 40),
                                child: FormBuilderTextField(
                                  name: "Textfield",
                                  decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                          onTap: () => _endDate(context),
                                          child: Icon(
                                            Icons.calendar_today_rounded,
                                            color: Colors.black,
                                          )),
                                      hintText: startDate.year.toString() +
                                          "/" +
                                          startDate.month.toString() +
                                          "/" +
                                          startDate.day.toString(),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                ),
                              ),
                            ),
                          ]),
                          Container(
                            height: height / 5,
                            margin: EdgeInsets.only(
                                right: width / 40, top: height / 100),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: Colors.black38)),
                            padding: EdgeInsets.only(
                                top: height / 200, left: width / 40),
                            child: FormBuilderTextField(
                              name: "Textfield",
                              decoration: InputDecoration(
                                  hintText: "Description",
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  seccheckbox = !seccheckbox;
                                });
                              },
                              child: CheckboxText(
                                check: seccheckbox,
                                text: "Product",
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: double.infinity,
                              height: height / 13,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: height / 65,
                                    bottom: height / 65,
                                    left: width / 3,
                                    right: width / 3),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF2684A),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Center(
                                    child: Text(
                                      "Save",
                                      style: kTitleDesc.copyWith(
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
