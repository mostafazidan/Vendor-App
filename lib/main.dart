import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/MoviesScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( VendorApp());
}

class VendorApp extends StatefulWidget {
  @override
  _VendorAppState createState() => _VendorAppState();
}

class _VendorAppState extends State<VendorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MoviesScreen(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
    );
  }
}
