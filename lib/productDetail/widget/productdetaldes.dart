import 'package:flutter/material.dart';
import '../constant.dart';

class Productdetaildes extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
     var height=MediaQuery.of(context).size.height;
     var width=MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: width/20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(top:height/45),
            child: Text(
              "Product Detail",
              style: kTitleDesc.copyWith(fontSize:height/50),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:height/85),
            child: Text(
              "Product description goes here",
              style: kTitle.copyWith(fontWeight: FontWeight.w200,fontSize: height/60),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top:height/85),
            child: Text("full description",
                style: TextStyle(color: Colors.lightBlue,
                fontSize: height/60)),
          ),
          Padding(
            padding:  EdgeInsets.only(top:height/45),
            child: Text(
              "Additional Information",
              style: kTitleDesc.copyWith(
                  fontSize: height/65, fontWeight: FontWeight.w300),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              "Colors",
              style: kTitleDesc.copyWith(fontSize: height/55),
            ),
          ),
        ],
      ),
    );
  }
}
