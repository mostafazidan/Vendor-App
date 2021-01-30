import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration titleStyle = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end:
    Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
    colors: [
      const Color(0xff2d27ff),
      const Color(0xffff0a6c)
    ], // red to yellow
    tileMode: TileMode.repeated, // repeats the gradient over the canvas
  ),);


const textFieldDecoration = InputDecoration(
  hintText: 'Enter a value',

  hintStyle: TextStyle(fontSize: 15.0),

  contentPadding:
  EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffff0a6c), width: 1),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),

);

const kPimaryColor = Color(0xffF7BB0E);

