import 'package:flutter/material.dart';

const kEditDecoration = InputDecoration(
  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
  hintText: "Enter the values",
  contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black38, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffF08626), width: 2.0),
  ),
);

const kTextStyle = TextStyle(letterSpacing: 0.1, color: Colors.black45);
