import 'package:flutter/material.dart';
import '../constant.dart';


class Productdetaildes extends StatefulWidget {
  @override
  _ProductdetaildesState createState() => _ProductdetaildesState();
}

bool showContainer = true;
String proddes =
    "A shoe is an item of footwear "

;

String firstHalf;
String secondHalf;

class _ProductdetaildesState extends State<Productdetaildes> {
  @override
  void initState() {
    super.initState();

    if (proddes.length > 50) {
      firstHalf = proddes.substring(0, 50);
      secondHalf = proddes.substring(50, proddes.length);
    } else {
      firstHalf = proddes;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: width / 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: height / 45),
            child: Text(
              "Product Detail",
              style: kTitleDesc.copyWith(fontSize: height / 50),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 85),
            child: Text(
              showContainer ? (firstHalf + "...") : (firstHalf + secondHalf),
              style: kTitle.copyWith(
                  fontWeight: FontWeight.w200, fontSize: height / 60),
            ),
          ),
          (proddes.length>30)?
          Padding(
            padding: EdgeInsets.only(top: height / 85),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    showContainer = true;
                  });
                },
                child: (showContainer)
                    ? SizedBox.shrink()
                    : Text("Close description",
                        style: TextStyle(
                            color: Colors.lightBlue, fontSize: height / 60))),
          ):SizedBox.shrink(),

          (proddes.length>50)?
          (showContainer)
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      showContainer = false;
                    });
                  },
                  child: Text(
                    "full description",
                    style: kTitle.copyWith(
                        fontSize: height / 60, color: Colors.lightBlue),
                  ),
                )
              : SizedBox.shrink():SizedBox.shrink(),
         
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              "Colors",
              style: kTitleDesc.copyWith(fontSize: height / 55),
            ),
          ),
        ],
      ),
    );
  }
}
