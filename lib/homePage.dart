import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  @override
  _homePage createState() => _homePage();
}

class _homePage extends State<homePage> {
  final GlobalKey <ScaffoldState> _scaffoldKey=new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
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
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
              onPressed: ()=> _scaffoldKey.currentState.openDrawer(),
            ),

            Text(
              "EzVote",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: "Pacifico",
              ),
            ),
            Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),

      drawer: Drawer(

      ),
    );
  }

}