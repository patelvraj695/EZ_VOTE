import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';


class FirestoreExample extends StatefulWidget {
  @override
  _FirestoreExample createState() => _FirestoreExample();
}

class _FirestoreExample extends State<FirestoreExample> {

  String email;

  @override
  void initState() {
    // TODO: implement initState
    inputData();
    super.initState();
  }

  void inputData() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    email=user.email;
    print(email);
  }

  final firestoreRef=Firestore.instance.collection('Multiple Option').document();

  Map<String,String> options={
    'Option 1':'Toyata',
    'Option 2':'Audi',
    'Option 3':'BMW',
  };

  Map<String,int> optionsValue={
    'Option 1':0,
    'Option 2':0,
    'Option 3':0,
  };

  String imageURL='';

  void addData(){
    Map <String,dynamic> data={
      'Question':'Toyata Vs Audi Vs BMW',
      'Category':'Everything Else',
      'Options': options,
      'OptionsValue':optionsValue,
      'Poll Duration': 2,
      'Image URL':imageURL,
      'Created By':email,
    };

    firestoreRef.setData(data).whenComplete(()=>{
      print("Data Added"),
    }).catchError((e)=>{print(e)});
  }

  void Option1(){
    Map <String,dynamic> data={
      'Question':'Toyata Vs Audi Vs BMW',
      'Category':'Everything Else',
      'Options': options,
      'OptionsValue':optionsValue,
      'Poll Duration': 2,
      'Image URL':imageURL,
      'Created By':email,
    };

    firestoreRef.setData(data).whenComplete(()=>{
      print("Data Added"),
    }).catchError((e)=>{print(e)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: FlatButton(
            child: Column(
              children: <Widget>[
                Text("ADD",style: TextStyle(fontSize: 40),),
              ],
            ),
            textColor: Colors.red,
            onPressed: ()=>addData(),
          ),
        ),
      )
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }


}

