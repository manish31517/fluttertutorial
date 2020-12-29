 import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:myblog/HomePage.dart'; // for the image file useer select from mobile
class UploadPhotoPage extends StatefulWidget {
  @override
  _UploadPhotoPageState createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage>{
  File sampleImage;
  String _myValue;
  String url;
  final _formKey = new GlobalKey<FormState>();
  Future getImage() async{
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
  setState(() {
    sampleImage =tempImage;
  });
  }

  bool validataAndSave(){
    final form = _formKey.currentState;
    if(form.validate())
      {
        form.save();
        return true;
      }
    return false;
  }
  void uploadStatusImage() async{
    if(validataAndSave())
      {
        final firebase_storage.Reference postImageRef= firebase_storage.FirebaseStorage.instance.ref().child("Post Images");
        var timekey = new DateTime.now();
        final firebase_storage.UploadTask  task= postImageRef.child(timekey.toString()+".jpg").putFile(sampleImage);
        var imageUrl = await(await task).ref.getDownloadURL();
        url = imageUrl.toString();
        print("Image"+url);
        goToHomePage();
        saveToDatabase(url);
      }
  }
  void saveToDatabase(url)
  {
    var dbtimekey = new DateTime.now();
    var formatDate = new DateFormat('MMM d,yyyy');
    var formatTime = new DateFormat("EEEE,hh:mm aaa"); // to get the time in am pm formata
    String date =  formatDate.format(dbtimekey);
    String time = formatTime.format(dbtimekey);
     DatabaseReference ref = FirebaseDatabase.instance.reference();
     var data ={
       "image":url,
       "description": _myValue,
       "data":date,
       "time":time,
    };
     ref.child("Posts").push().set(data);
  }
  void goToHomePage(){
    Navigator.push(context,MaterialPageRoute(builder: (context){
      return new Homepage();
    }));
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Upload Image"),
      ),
      body:new Center(
        child: sampleImage==null ? Text("Select and Image"): enableUpload(),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: getImage,
        tooltip: 'Add Image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget enableUpload(){
    return new SingleChildScrollView(
      child:new Container (
        child: new Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image.file(sampleImage,height: 330.0,width: 660,),
              SizedBox(height: 15.0,),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value){
                  return value.isEmpty ? "Block Description is required":null;
                },
                onSaved: (value) {
                  return _myValue=value;
                },
              ),
              SizedBox(height: 15.0,),
              RaisedButton(
                  elevation: 10.0,
                  child: Text("Add a new Post"),
                  textColor: Colors.white,
                  color:Colors.pink,
                  onPressed: uploadStatusImage)
            ],
          ),

        ),
      ) ,
    );

  }
}
