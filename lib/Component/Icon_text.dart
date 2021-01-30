import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: must_be_immutable
class IconText extends StatelessWidget {
  IconData icon;
  String text;
  IconText(this.icon,this.text);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(icon),
        SizedBox(width: 10,),
        Text(
          text,
          style: GoogleFonts.titilliumWeb(),
        ),

      ],
    );
  }
}
