import 'package:flutter/material.dart';
import 'package:myprofile/editpage/edit.dart';
import 'package:myprofile/storeedit/Category/category.dart';
import 'package:myprofile/storeedit/provider/datetime.dart';
import 'storeedit/screen/paymentedit.dart';
import 'package:provider/provider.dart';
import 'profile/profile.dart';
import './profile/checkuserintro.dart';
import 'productDetail/models/list.dart';
import './productadd/categorypages/categorypages.dart';
import "storeedit/provider/provider.dart";
import 'storeedit/provider/fluttermap.dart';
import 'storeedit/provider/paymentlist.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Allimage(),
        ),
        ChangeNotifierProvider(
          create: (context) => MapMarker(),
        ),
        
        ChangeNotifierProvider(
          create: (context) => Paymentlist(),
        ),

        ChangeNotifierProvider(
          create: (context)=>DateAndTimeSlect()

        ),
        
        ChangeNotifierProvider(
          create: (context) => ListCategory(),
        ),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Robotm"),
        home: CheckUserIntro(),
        routes: {
          MyProfile.id: (context) => MyProfile(),
          EditText.id: (context) => EditText(),
          CategoryPages.routeName: (context) => CategoryPages(),
          CategoryPage.routeName: (context) => CategoryPage(),
          EditPayment.routename: (context) => EditPayment()
        },
      ),
    );
  }
}

class DateAndTimeSlectimage {
}
