import 'package:flutter/material.dart';
import 'home.dart';
import 'multipleOption.dart';
import 'AB.dart';
import 'Rating.dart';
import 'agreeDisagree.dart';

import 'FirestoreExample.dart';

class pollOption extends StatefulWidget {
  @override
  _pollOption createState() => _pollOption();
}

class _pollOption extends State<pollOption> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[

          Container(
            height: 70.0,
            decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(55.0),
                  bottomRight: Radius.circular(55.0),
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    icon:Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: ()=>
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Home())
                      ),
                    }
                ),

                Text(
                  "Add Poll",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontFamily: "Pacifico",
                  ),
                ),
                IconButton(
                    icon:Icon(
                      Icons.verified_user,
                      color: Colors.lightGreenAccent,
                      size: 30,
                    ),
                    onPressed: ()=>
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>FirestoreExample())
                      ),
                    }
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Text(
            "Choose an option",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 22,
            ),
          ),

          SizedBox(
            height: 20,
          ),

          InkWell(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurpleAccent,
                    blurRadius: 4.0, // has the effect of softening the shadow
                    spreadRadius: 3.0, // has the effect of extending the shadow
                    offset: Offset(
                      0.0, // horizontal, move right 10
                      0.0, // vertical, move down 10
                    ),
                  )
                ],
              ),
              margin: EdgeInsets.fromLTRB(30,10,30,10),
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text(
                    "Multipe Option",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                  height: 10,
                  ),
                  
                  Image.asset('assets/images/multioption.jpg',width: 300,),
                ],
              ),
            ),
            onTap: ()=>{
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>multipleOption())
              )
            },
          ),

          SizedBox(
            height: 10,
          ),

          InkWell(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurpleAccent,
                    blurRadius: 4.0, // has the effect of softening the shadow
                    spreadRadius: 3.0, // has the effect of extending the shadow
                    offset: Offset(
                      0.0, // horizontal, move right 10
                      0.0, // vertical, move down 10
                    ),
                  )
                ],
              ),
              margin: EdgeInsets.fromLTRB(30,10,30,10),
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text(
                    "A/B",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Image.asset('assets/images/AB.jpg',width: 300,),
                ],
              ),
            ),
            onTap: ()=>{
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>AB())
              )
            },
          ),

          SizedBox(
            height: 10,
          ),

          InkWell(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurpleAccent,
                      blurRadius: 4.0, // has the effect of softening the shadow
                      spreadRadius: 3.0, // has the effect of extending the shadow
                      offset: Offset(
                        0.0, // horizontal, move right 10
                        0.0, // vertical, move down 10
                      ),
                    )
                  ],
              ),
              margin: EdgeInsets.fromLTRB(30,10,30,10),
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text(
                    "Rating",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Image.asset('assets/images/rating.jpg',width: 300,),
                ],
              ),
            ),
            onTap: ()=>{
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>Rating())
              )
            },
          ),

          SizedBox(
            height: 10,
          ),

          InkWell(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurpleAccent,
                    blurRadius: 4.0, // has the effect of softening the shadow
                    spreadRadius: 3.0, // has the effect of extending the shadow
                    offset: Offset(
                      0.0, // horizontal, move right 10
                      0.0, // vertical, move down 10
                    ),
                  )
                ],
              ),
              margin: EdgeInsets.fromLTRB(30,10,30,10),
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text(
                    "Agree/Disagree",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Image.asset('assets/images/agreeRating.jpg',width: 300,),
                ],
              ),
            ),
            onTap: ()=>{
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>agreeDisagree())
              )
            },
          ),

        ],
      )

    );
  }

}