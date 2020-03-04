import 'package:ez_vote/home.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
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
              "Profile",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontFamily: "Pacifico",
              ),
            ),
            Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),

    );
  }

}