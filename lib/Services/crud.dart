import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vendor_app/Model/Movie.dart';

// ignore: camel_case_types
class crudMethods{

  Future<void> addData(Movie movie) async{
     // ignore: deprecated_member_use
    await Firestore.instance.collection('Movie').add(movie.toData()).catchError((e){
       print(e);});

  }
  Future getData() async{
    // ignore: deprecated_member_use
    QuerySnapshot qn = await Firestore.instance.collection('Movie').getDocuments();
    // ignore: deprecated_member_use
    return qn.documents;
  }
  deleteData(docId){
    // ignore: deprecated_member_use
    Firestore.instance.collection('Movie').
    // ignore: deprecated_member_use
    document(docId).delete().
    catchError((e){
      print(e);
    });
  }
}