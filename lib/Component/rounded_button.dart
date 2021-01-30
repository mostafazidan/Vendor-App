import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class roundedButton extends StatelessWidget {
  roundedButton({@required this.title,@required this.onPressed});
  final String title;

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: onPressed,
            textColor: Colors.white,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
                gradient: LinearGradient(
                  colors: [Color(0xff2d27ff), Color(0xffff0a6c)]

                  ,),
              ),

              child: Text(title,textAlign: TextAlign.center,
                style: GoogleFonts.titilliumWeb(),
              ),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),


            ),)
      );
  }
}