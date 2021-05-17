import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FoodNearYouShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: width / 45),
      decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(5),
            topLeft: Radius.circular(5),
          )),
      height: height / 12,
      width: height / 5.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              color: Colors.grey[300],
              height: height / 10,
              width: double.infinity,
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Padding(
              padding: EdgeInsets.only(top: height / 300, left: width / 80),
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
              padding: EdgeInsets.only(top: height / 190, left: width / 40),
              child: Container(
                  color: Colors.grey[300],
                  height: height / 70,
                  width: height / 10),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Padding(
              padding: EdgeInsets.only(top: height / 200, left: width / 40),
              child: Container(
                  color: Colors.grey[300],
                  height: height / 70,
                  width: height / 10),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Padding(
              padding: EdgeInsets.only(top: height / 200, left: width / 40),
              child: Container(
                  color: Colors.grey[300],
                  height: height / 70,
                  width: height / 30),
            ),
          ),
        ],
      ),
    );
  }
}
