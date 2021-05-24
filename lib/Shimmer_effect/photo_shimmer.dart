import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';



class PhotoShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
    child:  Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Padding(
                padding: EdgeInsets.only(top: height / 150),
                child: Container(
                    color: Colors.grey[300],
                    height: height / 4,
                    width: double.infinity),
              ),
            )
    );
  }
}