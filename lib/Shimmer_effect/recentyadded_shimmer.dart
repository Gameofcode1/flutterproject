import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class RecentlyAddedShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
var height = MediaQuery.of(context).size.height;
    return Container(
              height: height / 8,
              margin: EdgeInsets.only(top: height / 40),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: height / 95),
                      width: height / 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[300],
                              ),
                              height: height / 8,
                              width: double.infinity,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            );
  }
}