import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:myprofile/productDetail/constant.dart';
class SlaesForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2.0, color: Colors.black38)),
                        child: FormBuilderTextField(
                          name: "Textfield",
                          decoration: InputDecoration(hintText: "Name",enabledBorder: InputBorder.none,focusedBorder: InputBorder.none),
                        )),
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 6.0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2.0, color: Colors.black38)),
                        child: FormBuilderTextField(
                          name: "Textfield",
                          decoration: InputDecoration(hintText: "Email",enabledBorder: InputBorder.none,focusedBorder: InputBorder.none),
                        )),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 16.0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.black38)),
                  child: FormBuilderTextField(
                    name: "Textfield",
                    decoration: InputDecoration(hintText: "Subject",enabledBorder: InputBorder.none,focusedBorder: InputBorder.none),
                  )),
              Container(
                height: 180.0,
                  margin: EdgeInsets.only(top: 16.0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.black38)),
                  child: FormBuilderTextField(
                    
                    name: "Textfield",
                    decoration: InputDecoration(hintText: "Messages",enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,),
                  )),
                   Container(
                            width: double.infinity,
                            height: 60.0,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 13.0,
                                  bottom: 10.0,
                                  left: 130.0,
                                  right: 130.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF2684A),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Center(
                                      child: Text(
                                    "Save",
                                    style: kTitleDesc.copyWith(
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ))),
                            ),
                          )
            ],
          ),
        ),
      ),
    );
  }
}
