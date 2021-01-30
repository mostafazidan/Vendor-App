import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendor_app/Component/movie_item.dart';
import 'package:vendor_app/Screens/MovieForm.dart';
import 'package:vendor_app/Services/crud.dart';


// ignore: deprecated_member_use
final movieRef = Firestore.instance.collection('Movie');
crudMethods crudObj = new crudMethods();

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title:GradientText('CINEMA PLUS+',
          gradient: LinearGradient(
              colors: [Color(0xff2d27ff), Color(0xffff0a6c)]),
          style: GoogleFonts.titilliumWeb(fontSize: 20.0),
        ),
      ),
    // ignore: deprecated_member_use
    body: StreamBuilder(stream:   Firestore.instance.collection("Movie").snapshots(),
        builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
                return Center(
                    child: CircularProgressIndicator(),);}
    return GridView.count(
    primary: false,
    padding: const EdgeInsets.all(1.5),
// card size
        childAspectRatio: 0.65,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        crossAxisCount: 2,
        // ignore: deprecated_member_use
        children: List.generate(snapshot.data.documents.length, (index) {
        // ignore: deprecated_member_use
        DocumentSnapshot movie = snapshot.data.documents[index];
        return MovieItem(movieImage: movie.get('image'),
        // ignore: deprecated_member_use
        movieId: snapshot.data.documents[index],
        title: movie.get('title'),
        numberOfSeats: movie.get('numberOfSeats'),);
        }),
        );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Color(0xff2d27ff) ,
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return MovieForm();
            }),
          );
        },
        child: Icon(Icons.add , color: Color(0xffff0a6c),),
        foregroundColor: Colors.white,
      ),
    );
  }
}
