import 'package:flutter/material.dart';

import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

import '../profile/profile.dart';

class IntroSliderPage extends StatefulWidget {
  @override
  _IntroSliderPageState createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();
    slides.add(
      new Slide(
        title: "Search Nearby",
        description:
            "Oripari is your own shopping guide to help find local stores near you!",
        pathImage: "images/nearby.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Save Your Time",
        description:
            "Time is money and you can save both of  them! Local at the shop very proce only at oripari",
        pathImage: "images/time.png",
      ),
    );

    slides.add(
      new Slide(
        title: "Grow your Bussness",
        description:
            "List your store and reach out to thousands of people around you.",
        pathImage: "images/grow.png",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    List<Widget> renderListCustomTabs() {
      List<Widget> tabs = new List();
      for (int i = 0; i < slides.length; i++) {
        Slide currentSlide = slides[i];
        tabs.add(
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              margin: EdgeInsets.only(bottom: height / 90, top: height / 5,left: height/20,right: height/60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                     margin: EdgeInsets.only(left: height / 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      currentSlide.pathImage,
                      fit: BoxFit.cover, 
                      matchTextDirection: true,
                      height: height / 4,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height / 17,bottom: height/90),
                    child: Text(
                      currentSlide.title,
                      style:
                          TextStyle(color: Colors.black, 
                          fontSize: height / 30,                       
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(

                    child: Text(
                      currentSlide.description,
                      style: TextStyle(
                        
                        fontSize: height / 50,
                      ),
                    maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: EdgeInsets.only(
                      top: height / 90,
                     
                  
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return tabs;
    }

    return SafeArea(
      child: IntroSlider(
        backgroundColorAllSlides: Colors.white,
        renderSkipBtn: Text(
          "Skip",
          style: TextStyle(fontSize: 15.0),
        ),
        renderNextBtn: Text(
          "Next",
          style: TextStyle(color: Colors.black, fontSize: 15.0),
        ),
        renderDoneBtn: Text(
          "Done",
          style: TextStyle(color: Colors.black, fontSize: 15.0),
        ),
        colorDoneBtn: Colors.white,
        colorActiveDot: Colors.white,
        sizeDot: 8.0,
        colorDot: Colors.orange[700],
        typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
        listCustomTabs: renderListCustomTabs(),
        scrollPhysics: BouncingScrollPhysics(),
        shouldHideStatusBar: false,
        onSkipPress:  () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => MyProfile()),
        ),
        onDonePress: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => MyProfile()),
        ),
      ),
    );
  }
}
