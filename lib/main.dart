import 'package:flutter/material.dart';
import 'package:myprofile/editpage/edit.dart';
import 'profile/profile.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatelessWidget {
  
  @override
  

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Robotm"
      ),
      home: MyProfile(),
      initialRoute: MyProfile.id,
       routes: {
         MyProfile.id:(context)=>MyProfile(),
        EditText.id: (context) => EditText(),

      },
    );
  }
}
