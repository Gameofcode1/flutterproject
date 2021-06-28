import 'package:flutter/material.dart';

class InstructionScreen extends StatelessWidget {
  const InstructionScreen();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
              top: height / 100, left: height / 100, right: height / 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios),
                Text("Instruction", style: TextStyle(fontSize: height / 40)),
                SizedBox(),
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Image(image: AssetImage("images/compas.png")),
              ),
            ),
            Center(
              child: Container(
                child:Text("Why anyone should turn on the location?",style: TextStyle(fontSize: height / 50,fontWeight:FontWeight.w700))
              ),
            ),
             Container(
                margin: EdgeInsets.only(top:height/35,right:height/50,left:height/100),
              child:Text("Oripari is the app which is totally based on the users location.It cames with the concept to sells or buy products near your current location.Without your location access users cannot enjoy the full features of oripari app.",textAlign:TextAlign.left,style: TextStyle(fontSize: height/50))
            )
          ]),
        ),
      ),
    );
  }
}
