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
        
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(5),
            topLeft: Radius.circular(5),
          )),
      height: height / 8,
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
              height: height/6,
              width: double.infinity,
            ),
          ),
        
        
         
        ],
      ),
    );
  }
}
