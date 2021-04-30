import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:myprofile/productDetail/models/list.dart';
import 'package:myprofile/productadd/Listproduct/list.dart';
import 'package:provider/provider.dart';

class AddImages extends StatefulWidget {
  final Function getImagefromcamera;
  final Function getImagefromGallery;

  AddImages({this.getImagefromGallery, this.getImagefromcamera});

  @override
  _AddImagesState createState() => _AddImagesState();
}

class _AddImagesState extends State<AddImages> {
  List<String> data = images.keys.toList();
  List<String> search = ["sun"];

  bool searchicon = false;
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
    var container = MediaQuery.of(context).size.height / 4;
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      margin: EdgeInsets.only(top: height / 60, bottom: height / 30),
      height: MediaQuery.of(context).size.height / 2,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          searchicon = !searchicon;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFDADADA),
                        radius: height / 35,
                        child: Icon(
                          Icons.search,
                          size: height / 25,
                          color: searchicon ? Colors.orange : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: widget.getImagefromGallery,
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
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: widget.getImagefromcamera,
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
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                      flex: 4,
                      child: Text(
                        "Search",
                        style: TextStyle(
                            fontSize: height / 50, fontWeight: FontWeight.w400),
                      )),
                  Expanded(
                      flex: 4,
                      child: Text(
                        "Gallery",
                        style: TextStyle(
                            fontSize: height / 50, fontWeight: FontWeight.w400),
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        "Camera",
                        style: TextStyle(
                            fontSize: height / 50, fontWeight: FontWeight.w400),
                      )),
                ],
              ),
            ),
            (searchicon)
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Container(
                        margin: EdgeInsets.only(
                            right: width / 40, top: height / 100,bottom: height/100),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border:
                                Border.all(width: 1.0, color: Colors.black38)),
                        padding: EdgeInsets.only(
                            top: height / 200, left: width / 40),
                        child: FormBuilderTextField(
                          name: "Textfield",
                          onChanged: onvaluechanged,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                size: height / 25,
                                color: Colors.black54,
                              ),
                              hintText: "car,bus,vegatables",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                      Card(
                          child: Expanded(
                              child: Container(
                                  width: MediaQuery.of(context).size.width/4,
                                  height: height / 5,
                                  
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    primary: false,
                                      itemCount: search.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              Provider.of<Allimage>(context,
                                                      listen: false)
                                                  .imagesadd(
                                                      images[search[index]]);
                                            });
                                          },
                                          child: Container(
                                              height: height/5,
                                              width:width/20,
                                              child: Image(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      images[search[index]]))),
                                        );
                                      })))),
                    ]),
                  )
                : Expanded(child: Container())
          ],
        ),
      ),
    );
  }
}
