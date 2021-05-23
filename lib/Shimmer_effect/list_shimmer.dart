import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 2.4,
      margin: EdgeInsets.only(top: height / 35),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
               
               
              ),
              margin: EdgeInsets.only(
                  left: height / 125, top: height / 100, right: height / 185),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: height / 95,
                            top: height / 100,
                            right: height / 95,
                            bottom: height / 100),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                        height: height / 7,
                        width: height / 10,
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: Expanded(
                      flex: 2,
                      child: Container(
                        width: height / 3.2,
                        margin: EdgeInsets.only(
                            top: height / 100,
                           
                            bottom: height / 100),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                        height: height / 7,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
