import 'package:flutter/material.dart';

const kEditDecoration = InputDecoration(
  border:OutlineInputBorder(),
  labelStyle: TextStyle(color: Colors.black),
  hintText: "Enter the values",
  contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.5),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black26, width: 1.5),
  ),
);

const kTextStyle = TextStyle(letterSpacing: 0.1, color: Colors.black45);
