import 'package:flutter/material.dart';
import 'package:myprofile/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myprofile/InroductionScreen/introduction.dart';


class CheckUserIntro extends StatefulWidget {
  



  @override
  _CheckUserIntroState createState() => _CheckUserIntroState();
}

class _CheckUserIntroState extends State<CheckUserIntro> {
   Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new MyProfile()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroSliderPage()));
    }
  }
  
  @override
  void initState() {
    super.initState();
  
    checkFirstSeen();
    
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}