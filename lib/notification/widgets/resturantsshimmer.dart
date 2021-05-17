import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ResturantSlimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
          left: height / 130, right: height / 130, top: height / 160),
      padding: EdgeInsets.only(
          left: width / 30, right: width / 20, top: height / 150),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Padding(
              padding: EdgeInsets.only(top: height / 200, left: width / 80),
              child: Container(
                  color: Colors.grey[300],
                  height: height / 70,
                  width: height / 6),
            ),
          ),
          
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Padding(
              padding: EdgeInsets.only(top: height / 150, left: width / 80),
              child: Container(
                  color: Colors.grey[300],
                  height: height / 70,
                  width: height / 6),
            ),
          ),
          SizedBox(width: width / 10),
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Padding(
              padding: EdgeInsets.only(top: height / 150, left: width / 80),
              child: Container(
                  color: Colors.grey[300],
                  height: height / 70,
                  width: height / 6),
            ),
          ),
        ],
      ),
    );
  }
}
