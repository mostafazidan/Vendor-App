import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'file:///D:/College/4th%20Year/First%20Tearm/E_Commerce/Section/Projects/vendor_app/lib/Services/crud.dart';
import 'package:vendor_app/Model/Movie.dart';

crudMethods crudObj = new crudMethods();
Movie movie = new Movie();

class MovieForm extends StatefulWidget {
  static const String id = 'MovieForm';


  @override
  _MovieFormState createState() => _MovieFormState();
}

class _MovieFormState extends State<MovieForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List _times =[];
  String _imageUrl;
  File _imageFile;
  // ignore: non_constant_identifier_names
  TextEditingController TimesContoller = new TextEditingController();

  // Movie movie ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text('Movie Form')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(children: <Widget>[
              _showImage(),
              SizedBox(height: 16),
              Text(
                "Create Movie",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 16),
              _imageFile == null && _imageUrl == null
                  ? ButtonTheme(
                child: RaisedButton(
                  onPressed: (){  showModalBottomSheet(
                      context: context,
                      // ignore: non_constant_identifier_names
                      builder: (BuildContext)=>bottomSheet());},
                  child: Text(
                    'Add Image',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
                  : SizedBox(height: 0),
              _buildTitleField(),
              SizedBox(height: 16),
              _buildTimeDateField(),
              SizedBox(height: 16),
              aboutTextField(),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff2d27ff),
          onPressed: () {
            sendData();
          },
          child: Icon(Icons.save),
          foregroundColor: Colors.white,)

    );
  }

  // ignore: non_constant_identifier_names
  TextEditingController Title = TextEditingController() ;
  // ignore: non_constant_identifier_names
  TextEditingController TimeDate = TextEditingController() ;
  // ignore: non_constant_identifier_names
  TextEditingController Description = TextEditingController() ;
  TextEditingController img = TextEditingController() ;

  Widget _buildTitleField() {
    return TextFormField(
      controller: Title,
      decoration: InputDecoration(labelText: 'Movie Name'),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is required';
        }
        if (value.length < 2 || value.length > 40) {
          return 'Name must be more than 2 and less than 40';
        }
        return null;
      },

    );
  }
  Widget _buildTimeDateField() {
    return TextFormField(
      controller: TimeDate,
      decoration: InputDecoration(labelText: 'Date Time'),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Time is required';
        }
        return null;
      },

    );
  }
  _getGalleryImage() async {
    File imageFile =
    // ignore: deprecated_member_use
    await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50, maxWidth: 400);

    if (imageFile != null) {
      setState(() {
        _imageFile = imageFile;
      });
    }
  }
  _getCameraImage() async {
    File imageFile =
    // ignore: deprecated_member_use
    await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 400);

    if (imageFile != null) {
      setState(() {
        _imageFile = imageFile;
      });
    }
  }
  Widget bottomSheet(){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin:EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ) ,
      child: Column(
        children: [
          Text("Choose movie photo",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                onPressed: _getCameraImage,
                icon: Icon(Icons.camera),
                label: Text("Camera"),
              ),
              FlatButton.icon
                (onPressed: _getGalleryImage,
                icon: Icon(Icons.image)
                ,label: Text("Gallery"),
              ),
            ],
          )

        ],
      ),
    );
  }
  _showImage() {
    if (_imageFile == null && _imageUrl == null) {
      return Text("image placeholder");
    } else if (_imageFile != null) {
      print('showing image from local file');
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.file(
            _imageFile,
            fit: BoxFit.cover,
            height: 250,
          ),
          FlatButton(
            padding: EdgeInsets.all(16),
            color: Colors.black54,
            child: Text(
              'Change Image',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
            ),
            onPressed: () {
              // ignore: non_constant_identifier_names
              showModalBottomSheet(context: context, builder: (BuildContext)=>bottomSheet());
            },
          )
        ],
      );
    } else if (_imageUrl != null) {
      print('showing image from url');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.network(
            _imageUrl,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            height: 250,
          ),
          FlatButton(
            padding: EdgeInsets.all(16),
            color: Colors.black54,
            child: Text(
              'Change Image',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
            ),
            // ignore: non_constant_identifier_names
            onPressed: () => showModalBottomSheet(context: context, builder: (BuildContext)=>bottomSheet()),

          )
        ],
      );
    }
  }
  Widget aboutTextField(){
    return TextFormField(
      controller: Description,
      maxLines: 6,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
          labelText: "Description",
          helperText: "Movie description"
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Description is required';
        }
        if (value.length < 2 || value.length > 900) {
          return 'Description must be more than 2 and less than 900';
        }
        return null;},
    );
  }
  sendData() async{
    //Validation
    if(_formKey.currentState.validate()){
      var storageImage = FirebaseStorage.instance.ref().child(_imageFile.path);
      var task = storageImage.putFile(_imageFile);
      _imageUrl = await(await task).ref.getDownloadURL();
      movie.image=_imageUrl.toString();
      movie.description=Description.text;
      movie.numberOfSeats=47;
      movie.title=Title.text;
      movie.movieTime=TimeDate.text;
      movie.times=_times;
      movie.seats = [{"id": 1, "isReserved": true, "user": ""},
        {"id": 2, "isReserved": true, "user": ""},
        {"id": 3, "isReserved": false, "user": ""},
        {"id": 4, "isReserved": false, "user": ""},
        {"id": 5, "isReserved": false, "user": ""},
        {"id": 6, "isReserved": false, "user": ""},
        {"id": 7, "isReserved": false, "user": ""},
        {"id": 8, "isReserved": false, "user": ""},
        {"id": 9, "isReserved": false, "user": ""},
        {"id": 10, "isReserved": false, "user": ""},
        {"id": 11, "isReserved": false, "user": ""},
        {"id": 12, "isReserved": false, "user": ""},
        {"id": 13, "isReserved": false, "user": ""},
        {"id": 14, "isReserved": false, "user": ""},
        {"id": 15, "isReserved": false, "user": ""},
        {"id": 16, "isReserved": false, "user": ""},
        {"id": 17, "isReserved": false, "user": ""},
        {"id": 18, "isReserved": false, "user": ""},
        {"id": 19, "isReserved": false, "user": ""},
        {"id": 20, "isReserved": false, "user": ""},
        {"id": 21, "isReserved": false, "user": ""},
        {"id": 22, "isReserved": false, "user": ""},
        {"id": 23, "isReserved": false, "user": ""},
        {"id": 24, "isReserved": false, "user": ""},
        {"id": 25, "isReserved": false, "user": ""},
        {"id": 26, "isReserved": false, "user": ""},
        {"id": 27, "isReserved": false, "user": ""},
        {"id": 28, "isReserved": false, "user": ""},
        {"id": 29, "isReserved": false, "user": ""},
        {"id": 30, "isReserved": false, "user": ""},
        {"id": 31, "isReserved": false, "user": ""},
        {"id": 32, "isReserved": false, "user": ""},
        {"id": 33, "isReserved": false, "user": ""},
        {"id": 34, "isReserved": false, "user": ""},
        {"id": 35, "isReserved": false, "user": ""},
        {"id": 36, "isReserved": false, "user": ""},
        {"id": 37, "isReserved": false, "user": ""},
        {"id": 38, "isReserved": false, "user": ""},
        {"id": 39, "isReserved": false, "user": ""},
        {"id": 40, "isReserved": false, "user": ""},
        {"id": 41, "isReserved": false, "user": ""},
        {"id": 42, "isReserved": false, "user": ""},
        {"id": 43, "isReserved": false, "user": ""},
        {"id": 44, "isReserved": false, "user": ""},
        {"id": 45, "isReserved": false, "user": ""},
        {"id": 46, "isReserved": false, "user": ""},
        {"id": 47, "isReserved": false, "user": ""},
      ];


      crudObj.addData(movie);
    }
    else{
      Scaffold.of(context).showSnackBar(
          (SnackBar(content: Text("You cannot make field empty"),)));
    }
  }

}