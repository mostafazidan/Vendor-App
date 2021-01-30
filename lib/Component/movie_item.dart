import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendor_app/Screens/DetailsScreen.dart';
import 'package:vendor_app/Services/crud.dart';

// ignore: must_be_immutable
class MovieItem extends StatelessWidget {
  final String title;
  final int numberOfSeats;
  final String movieImage;
  final DocumentSnapshot movieId ;
  crudMethods crudObj = new crudMethods();
  MovieItem({this.title,this.movieImage,this.numberOfSeats,this.movieId});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Route route = MaterialPageRoute(builder: (context)=>
            DetailsScreen(id:movieId,));
        Navigator.pushReplacement(context, route);

      },
      child: Card(
        elevation: 10.0,
        color: Color(0xFF151A3C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 200.0,
                width: 130.0,
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.all(Radius.circular(15)) ,
                    image: DecorationImage(
                      image: NetworkImage(movieImage,),
                      fit: BoxFit.fill,
                    )
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(title,
                    style: GoogleFonts.titilliumWeb(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
                RawMaterialButton(
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      gradient: LinearGradient(
                        colors: [Color(0xff2d27ff), Color(0xffff0a6c)]
                        ,),
                    ),
                    child: Icon(
                        Icons.remove),
                  ),
                  onPressed: () {
                    // ignore: deprecated_member_use
                    crudObj.deleteData(movieId.documentID);
                  },
                  shape: CircleBorder(),
                  fillColor: Color(0xFF4C4F5E),
                  constraints: BoxConstraints.tightFor(
                    width: 35.0,
                    height: 35.0,
                  ),
                  elevation: 0.0,
                ),
              ],
            ),

            Padding(padding:EdgeInsets.all(10),child:
            Text(numberOfSeats.toString()+' Seats is booked')),
          ],
        ),
      ),
    );
  }
}
