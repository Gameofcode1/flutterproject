import 'package:flutter/material.dart';

const kEditDecoration = InputDecoration(
  hintText: "Enter the values",
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
  ),
);
