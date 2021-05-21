import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmer extends StatelessWidget {

  @override
  
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
              height: height / 20,
              margin: EdgeInsets.only(top: height / 15),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: height / 95),
                      width: height / 9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.grey[300],
                              ),
                              height: height / 20,
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