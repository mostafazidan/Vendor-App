import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendor_app/Component/movie_seats.dart';
import 'package:vendor_app/Component/time.dart';
import 'package:vendor_app/Screens/MoviesScreen.dart';

 // ignore: deprecated_member_use
 final movieRef = Firestore.instance.collection('Movie');

// ignore: must_be_immutable
 class DetailsScreen extends StatefulWidget {
   DocumentSnapshot id ;
   DetailsScreen({this.id});
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Title(color: Colors.white, child: Text(widget.id.get('title'))),
          
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              // container for film poster
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  alignment: FractionalOffset.topCenter,
                  image: NetworkImage(widget.id.get('image'),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(widget.id.get('title'),
                          textAlign: TextAlign.left,
                          style: GoogleFonts.titilliumWeb(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w600,
                              height: 1.0,
                              letterSpacing: 1.0),
                        ),
                      ),
                      Text(
                        '',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.titilliumWeb(
                            fontSize: 20.0,
                            color: Color(0xffff0a6c),
                            fontWeight: FontWeight.w600,
                            height: 1.0,
                            letterSpacing: 1.0),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Movie Story:',
                    style: GoogleFonts.titilliumWeb(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                        height: 1.0,
                        letterSpacing: 1.0),
                  ),
                  SizedBox(height: 10.0,),
                  Text(widget.id.get('description'),
                    style: GoogleFonts.titilliumWeb(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300,
                        height: 1.25,
                        letterSpacing: 1.0),
                  ), ],),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ShowTime(
                    time: '11:00',
                    price: 5,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: true,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'Screen',
                    style: GoogleFonts.titilliumWeb(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),

                  //seats view
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        //FIRST ROW
                        Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            CienmaSeat(
                              selectedId: widget.id.get('seats')[0]["id"],
                              isReserved: widget.id.get('seats')[0]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[1]["id"],
                              isReserved: widget.id.get('seats')[1]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[2]["id"],
                              isReserved: widget.id.get('seats')[2]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[3]["id"],
                              isReserved: widget.id.get('seats')[3]["isReserved"],
                              movie: widget.id,
                            ),
                            SizedBox(
                              width:
                              (MediaQuery.of(context).size.width / 9.5) * 2,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[4]["id"],
                              isReserved: widget.id.get('seats')[4]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[5]["id"],
                              isReserved: widget.id.get('seats')[5]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[6]["id"],
                              isReserved: widget.id.get('seats')[6]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[7]["id"],
                              isReserved: widget.id.get('seats')[7]["isReserved"],
                              movie: widget.id,
                            ),CienmaSeat(
                              selectedId: widget.id.get('seats')[8]["id"],
                              isReserved: widget.id.get('seats')[8]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[9]["id"],
                              isReserved: widget.id.get('seats')[9]["isReserved"],
                              movie: widget.id,
                            ),                          ],
                        ),
                        // Second Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[10]["id"],
                              isReserved: widget.id.get('seats')[10]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[11]["id"],
                              isReserved: widget.id.get('seats')[11]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[12]["id"],
                              isReserved: widget.id.get('seats')[12]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[13]["id"],
                              isReserved: widget.id.get('seats')[13]["isReserved"],
                              movie: widget.id,
                            ),
                            SizedBox(
                              width:
                              (MediaQuery.of(context).size.width / 9.5) * 2,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[14]["id"],
                              isReserved: widget.id.get('seats')[14]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[15]["id"],
                              isReserved: widget.id.get('seats')[15]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[16]["id"],
                              isReserved: widget.id.get('seats')[16]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[17]["id"],
                              isReserved: widget.id.get('seats')[17]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[18]["id"],
                              isReserved: widget.id.get('seats')[18]["isReserved"],
                              movie: widget.id,
                            ),
                          ],
                        ),
                        // Third  Row

                        // 4TH Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[19]["id"],
                              isReserved: widget.id.get('seats')[19]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[20]["id"],
                              isReserved: widget.id.get('seats')[20]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[21]["id"],
                              isReserved: widget.id.get('seats')[21]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(),
                            SizedBox(
                              width:
                              (MediaQuery.of(context).size.width / 9.5) * 2,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[22]["id"],
                              isReserved: widget.id.get('seats')[22]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[23]["id"],
                              isReserved: widget.id.get('seats')[23]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[24]["id"],
                              isReserved: widget.id.get('seats')[24]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[25]["id"],
                              isReserved: widget.id.get('seats')[25]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[26]["id"],
                              isReserved: widget.id.get('seats')[26]["isReserved"],
                              movie: widget.id,
                            ),
                          ],
                        ),
                        // 5TH ROW
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[27]["id"],
                              isReserved: widget.id.get('seats')[27]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[28]["id"],
                              isReserved: widget.id.get('seats')[28]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[29]["id"],
                              isReserved: widget.id.get('seats')[29]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[30]["id"],
                              isReserved: widget.id.get('seats')[30]["isReserved"],
                              movie: widget.id,
                            ),
                            SizedBox(
                              width:
                              (MediaQuery.of(context).size.width / 9.5) * 2,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[31]["id"],
                              isReserved: widget.id.get('seats')[31]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[32]["id"],
                              isReserved: widget.id.get('seats')[32]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[33]["id"],
                              isReserved: widget.id.get('seats')[33]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[34]["id"],
                              isReserved: widget.id.get('seats')[34]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[35]["id"],
                              isReserved: widget.id.get('seats')[35]["isReserved"],
                              movie: widget.id,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[36]["id"],
                              isReserved: widget.id.get('seats')[36]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[37]["id"],
                              isReserved: widget.id.get('seats')[37]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[38]["id"],
                              isReserved: widget.id.get('seats')[38]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[39]["id"],
                              isReserved: widget.id.get('seats')[39]["isReserved"],
                              movie: widget.id,
                            ),

                            // SizedBox(
                            //   width: (MediaQuery.of(context).size.width / 20) * 2,
                            // ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[40]["id"],
                              isReserved: widget.id.get('seats')[40]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[41]["id"],
                              isReserved: widget.id.get('seats')[41]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[42]["id"],
                              isReserved: widget.id.get('seats')[42]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[43]["id"],
                              isReserved: widget.id.get('seats')[43]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[44]["id"],
                              isReserved: widget.id.get('seats')[44]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[45]["id"],
                              isReserved: widget.id.get('seats')[45]["isReserved"],
                              movie: widget.id,
                            ),
                            CienmaSeat(
                              selectedId: widget.id.get('seats')[46]["id"],
                              isReserved: widget.id.get('seats')[46]["isReserved"],
                              movie: widget.id,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),

            SizedBox(
              height: 200.0,
            )
          ]),
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Color(0xff2d27ff) ,
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return MoviesScreen();
            }),
          );
        },
        child: Icon(Icons.arrow_back , color: Color(0xffff0a6c),),
        foregroundColor: Colors.white,
      ),
    );
  }
}
