import 'package:ez_vote/verifyACC.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

class Signup extends StatefulWidget {
  @override
  _Signup  createState() => _Signup ();
}

class _Signup  extends State<Signup > {
  final _formkey=GlobalKey<FormState>();


  String _email;
  String _pw;
  String name;

  bool passwordVisible=false;
  bool obscuretextval=true;

  String validateEmail(value){
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      showSnackBar('Email Is Required');
      return null;
    }
    else if(!regExp.hasMatch(value)){
      showSnackBar('Invalid Email');
      return null;
    }
    else{
      return null;
    }
  }

  String validatePW(value){
    String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})';
    RegExp regExp = new RegExp(pattern);
    if(value.length == 0){
      showSnackBar('Password Is Required');
      return null;
    }
    else if(!regExp.hasMatch(value)){
      showSnackBar('Invalid Password');
      return null;
    }

    else {
      return null;
    }
  }

  final GlobalKey <ScaffoldState> _scaffoldKey=new GlobalKey<ScaffoldState>();

  showSnackBar(string){
    SnackBar mysnackbar = new SnackBar(
      content: Text(string),
      duration: Duration(seconds: 2),
      action: new SnackBarAction(label:'Cancel',textColor: Colors.purple, onPressed:()=>print("OK Pressed")),
    );
    _scaffoldKey.currentState.showSnackBar(mysnackbar);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignUp() async {
    if(_formkey.currentState.validate()){
      _formkey.currentState.save();
      try{
        final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(email: _email, password: _pw)).user;
        if(user.isEmailVerified){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> Home()),
          );
        }
        else{
          await user.sendEmailVerification();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> verifyACC()),
          );
          print("verify Your Email");
        }
        return user;
      }catch(e){
        showSnackBar("You Already Have Account");
        print(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child:ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[

                ClipPath(
                  clipper: WaveClipper2(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.purple[500].withOpacity(0.3),
                              Colors.purple[300].withOpacity(0.3),
                            ])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper3(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.purple[500].withOpacity(0.1),
                              Colors.purple[300].withOpacity(0.1),
                            ]
                        )),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper1(),
                  child: Container(
                    child: Column(
                      children: <Widget>[

                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Odachi',
                              fontSize: 80),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 300,


                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.purple[500],
                            Colors.purple[400],
                            Colors.purple[300],
                          ]
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextFormField(
                  validator: (value)=>validateEmail(value),
                  onSaved: (String val){_email = val;},
                  cursorColor: Colors.purple,
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.email,
                          color: Colors.purple,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextFormField(
                  obscureText: obscuretextval,
                  validator: (value)=>validatePW(value),
                  onSaved: (value)=>{_pw=value,},
                  cursorColor: Colors.purple,
                  decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color:Colors.purple /*Theme.of(context).primaryColorDark*/,
                        ),
                        onPressed: () {

                          setState(() {
                            passwordVisible = !passwordVisible;
                            obscuretextval=!obscuretextval;
                          });
                        },
                      ),
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.lock,
                          color: Colors.purple,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Colors.purple[400]),
                  child: FlatButton(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    onPressed: ()=>{
                      if(_formkey.currentState.validate()){
                        _formkey.currentState.save(),
                        _handleSignUp(),
                      }
                    },
                  ),
                ),
            ),

            SizedBox(
              height: 50,
            ),

            Center(child:InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> Login()),
                );
              },
              child:Text(
                "Back",
                style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ))
              ],
            )
      ),
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