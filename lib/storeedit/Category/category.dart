import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:myprofile/productadd/Listproduct/list.dart';
import 'package:myprofile/storeedit/provider/catclass.dart';
import 'package:myprofile/storeedit/provider/provider.dart';
import 'package:myprofile/storeedit/storeedit.dart';
import 'package:myprofile/storeedit/widgets/categorycard.dart';

import 'package:provider/provider.dart';

import '../provider/categoryselect.dart';

class CategoryPage extends StatefulWidget with ChangeNotifier {
  final int count;

  CategoryPage({this.count});
  static const routeName = "Storecat";

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

List<Catclass> searchcat = List.from(citems);

class _CategoryPageState extends State<CategoryPage> {

  onitemchang(String value) {
    setState(() {
      searchcat = citems
          .where((string) =>
              string.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final productid = ModalRoute.of(context).settings.arguments as int;

    final listcat = Provider.of<ListCategory>(context);

    return Scaffold(
        body: SafeArea(
            child: Container(
      margin: EdgeInsets.only(left: width / 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                  child: Text(
                "Select Category",
                style: TextStyle(
                    fontSize: height / 45, fontWeight: FontWeight.w800),
              )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
               
                left: width / 40,
                bottom: height / 100),
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black38),
                borderRadius: BorderRadius.circular(30.0)),
            padding: EdgeInsets.only(top: height / 300, left: width / 40),
            child: Container(
             
              child: FormBuilderTextField(
                name: "Textfield",
                onChanged: onitemchang,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: width / 3.4, top: height / 60),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.orange,
                    ),
                    hintText: "Search Store...",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: width / 43, right: width / 43),
              child: GridView.builder(
                
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 6 / 3.3,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0),
                  itemCount: searchcat.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return ChangeNotifierProvider.value(
                        value: searchcat[index], child: CategoryCard());
                  }),
            ),
          ),
          GestureDetector(
            onTap: () { listcat.clearlist();
              listcat.addlist(catagorie[productid].name);
              listcat.cat.clear();
              
              listcat.newpay();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StoreEdit()));
            },
            child: Container(
                width: double.infinity,
                height: height / 17,
                margin: EdgeInsets.only(
                    left: width / 35, right: width / 35, bottom: height / 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color(0xffF08626),
                ),
                child: Center(
                  child: Text(
                    "Save",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.white, fontSize: height / 40),
                  ),
                )),
          ),
        ],
      ),
    )));
  }
}
