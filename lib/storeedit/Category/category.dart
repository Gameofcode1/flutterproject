import 'package:flutter/material.dart';
import 'package:myprofile/productadd/Listproduct/list.dart';
import 'package:myprofile/storeedit/provider/provider.dart';
import 'package:myprofile/storeedit/storeedit.dart';

import 'package:provider/provider.dart';

import '../provider/categoryselect.dart';

class CategoryPage extends StatelessWidget with ChangeNotifier {
  final int count;

  CategoryPage({this.count});
  static const routeName = "Storecat";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final productid = ModalRoute.of(context).settings.arguments as int;

    final selectcat = Provider.of<CategorySelect>(context);
    final listcat = Provider.of<ListCategory>(context);

    return Scaffold(
        body: SafeArea(
            child: Container(
      margin: EdgeInsets.only(left: width / 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: height / 29,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: height / 30,
          ),
          Container(
              margin: EdgeInsets.only(left: width / 30, bottom: height / 50),
              child: Text(
                "Select Category",
                style: TextStyle(
                    fontSize: height / 45, fontWeight: FontWeight.w800),
              )),
          Expanded(
            child: Container(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 6 / 3.3,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0),
                  itemCount: selectcat.citems.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return TextButton(
                        onPressed: () {
                          listcat.clearlist();
                          listcat.addlist(catagorie[productid].name);
                          listcat.addlist(selectcat.citems[index].title);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StoreEdit()));
                        },
                        child: Container(
                            width: width / 2, child: selectcat.citems[index]));
                  }),
            ),
          ),
        ],
      ),
    )));
  }
}
