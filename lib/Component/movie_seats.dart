import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

// ignore: must_be_immutable
class CienmaSeat extends StatefulWidget {
  bool isReserved;
  bool isSelected;
  DocumentSnapshot movie ;
  int selectedId ;

  CienmaSeat({this.isSelected = false, this.isReserved = false,this.movie,this.selectedId});
  @override
  _CienmaSeatState createState() => _CienmaSeatState();
}

class _CienmaSeatState extends State<CienmaSeat> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
          width: MediaQuery.of(context).size.width / 15,
          height: MediaQuery.of(context).size.width / 15,
          decoration: BoxDecoration(
              color: widget.isSelected
                  ? kPimaryColor
                  : widget.isReserved ? Color(0x802d27ff): null,
              border: !widget.isSelected && !widget.isReserved
                  ? Border.all(color:Color(0xffff0a6c)
                  , width: 1.0)
                  : null,
              borderRadius: BorderRadius.circular(5.0))),
    );

  }
}