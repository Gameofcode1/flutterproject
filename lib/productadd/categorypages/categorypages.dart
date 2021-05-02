import 'package:flutter/material.dart';
import 'package:myprofile/productadd/Listproduct/list.dart';
import 'package:myprofile/productadd/models/titles.dart';

import 'package:myprofile/productadd/productadd.dart';
import 'package:provider/provider.dart';
import 'package:myprofile/productDetail/models/list.dart';

class CategoryPages extends StatelessWidget with ChangeNotifier {
  final int count;

  CategoryPages({this.count});
  static const routeName = "maincatagory";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final image = Provider.of<Allimage>(context);
    final productid = ModalRoute.of(context).settings.arguments as int;
    final loadedproduct = catagorie.firstWhere((prod) => prod.id == productid);

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
                  (loadedproduct.id == 0)
                      ? catagorie[loadedproduct.id].name
                      : (loadedproduct.id == 1)
                          ? catagorie[loadedproduct.id].name
                          : (loadedproduct.id == 2)
                              ? catagorie[loadedproduct.id].name
                              : catagorie[loadedproduct.id].name,
                  style: TextStyle(fontSize: height / 40),
                ),
                SizedBox()
              ],
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ((loadedproduct.id == 0)
                        ? clothing
                        : (loadedproduct.id == 1)
                            ? electronic
                            : (loadedproduct.id == 2)
                                ? fashion
                                : food)
                    .map<Widget>((url) {
                  int index = ((loadedproduct.id == 0)
                          ? clothing
                          : (loadedproduct.id == 1)
                              ? electronic
                              : (loadedproduct.id == 2)
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

                                image.addcata.add(catagorie[productid].name);
                                image.addcata.add(
                                  (loadedproduct.id == 0)
                                      ? clothing[index]
                                      : (loadedproduct.id == 1)
                                          ? electronic[index]
                                          : (loadedproduct.id == 2)
                                              ? fashion[index]
                                              : food[index],
                                );
                              },
                              child: Text(
                                (loadedproduct.id == 0)
                                    ? clothing[index]
                                    : (loadedproduct.id == 1)
                                        ? electronic[index]
                                        : (loadedproduct.id == 2)
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
