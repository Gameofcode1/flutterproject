import 'package:flutter/material.dart';
import 'package:myprofile/productadd/Listproduct/list.dart';

import 'package:myprofile/productadd/productadd.dart';
import 'package:provider/provider.dart';
import 'package:myprofile/productDetail/models/list.dart';

class CategoryPages extends StatelessWidget with ChangeNotifier {
  final int count;

  CategoryPages({this.count});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final image = Provider.of<Allimage>(context);
    final allimages = image.images;
    return Scaffold(
        body: SafeArea(
      child: Container(
          margin: EdgeInsets.only(left: width / 50, bottom: height / 30),
          child: ListView(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  (count == 0)
                      ? catagorie[count]
                      : (count == 2)
                          ? catagorie[count]
                          : (count == 3)
                              ? catagorie[count]
                              : catagorie[count],
                  style: TextStyle(fontSize: height / 40),
                ),
                SizedBox()
              ],
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ((count == 0)
                        ? clothing
                        : (count == 1)
                            ? electronic
                            : (count == 2)
                                ? fashion
                                : food)
                    .map<Widget>((url) {
                  int index = ((count == 0)
                          ? clothing
                          : (count == 1)
                              ? electronic
                              : (count == 2)
                                  ? fashion
                                  : food)
                      .indexOf(url);
                  return Container(
                      margin: EdgeInsets.only(
                          left: width / 50, bottom: height / 90),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductAdd()));
                                image.addcata.clear();

                                image.addcata.add(catagorie[count]);
                                image.addcata.add(
                                  (count == 0)
                                      ? clothing[index]
                                      : (count == 1)
                                          ? electronic[index]
                                          : (count == 2)
                                              ? fashion[index]
                                              : food[index],
                                );
                              },
                              child: Text(
                                (count == 0)
                                    ? clothing[index]
                                    : (count == 1)
                                        ? electronic[index]
                                        : (count == 2)
                                            ? fashion[index]
                                            : food[index],
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ));
                }).toList()),
          ])),
    ));
  }
}
