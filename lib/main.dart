import 'package:flutter/material.dart';
import 'package:myprofile/editpage/edit.dart';
import 'package:provider/provider.dart';
import 'profile/profile.dart';
import './profile/checkuserintro.dart';
import 'productDetail/models/list.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

       create: (context)=>Allimage(),
       
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Robotm"),
        home: CheckUserIntro(),
       
        routes: {
          MyProfile.id: (context) => MyProfile(),
          EditText.id: (context) => EditText(),
        },
      ),
    );
  }
}
