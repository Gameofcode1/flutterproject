import 'package:flutter/material.dart';
import '../constant.dart';

class Productdetaildes extends StatefulWidget {
  @override
  _ProductdetaildesState createState() => _ProductdetaildesState();
}

bool showContainer = true;
String proddes =
    "A shoe is an item of footwear intended to protect and comfort the human foot. Shoes are also used as an item of decoration and fashion. The design of shoes has varied enormously through time and from culture to culture, with appearance originally being tied to function. Though the human foot is adapted to varied terrain and climate conditions, it is still vulnerable to environmental hazards such as sharp rocks and temperature extremes, which shoes protect against. Some shoes are worn as safety equipment, such as steel-soled boots which are required on construction sites";

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
          (proddes.length > 30)
              ? Padding(
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
                                  color: Colors.lightBlue,
                                  fontSize: height / 60))),
                )
              : SizedBox.shrink(),
          (proddes.length > 50)
              ? (showContainer)
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
                  : SizedBox.shrink()
              : SizedBox.shrink(),
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
