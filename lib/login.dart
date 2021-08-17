import 'dart:async';
import 'dart:core';
import 'dart:core';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'DashboardScreen.dart';
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}
class _loginState extends State<login> {
  bool flag=false;
  var databaseReference;
  var ref;
  Timer _timer;
  @override
  void initState() {
      Firebase.initializeApp();
      _timer = new Timer(const Duration(milliseconds: 300), () {
        setState(() {
          String uuid = FirebaseAuth.instance.currentUser.uid;
          if (uuid != null) {
            _staffstatus(uuid);
          }else {
            flag=true;
          }
        });
      });


  }
  _staffstatus(String uuid) async {
    final databaseReference = FirebaseDatabase.instance;
    ref = databaseReference.reference().child('Staff');
    await ref
        .child(uuid)
        .once()
        .then((DataSnapshot snapshot) {
      String isblook = snapshot.value["Status"];
      if (isblook == "true") {
        Fluttertoast.showToast(msg: "you are block from administration");
        exit(0);
      } else if(isblook == "false") {
        setState(() {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => DashboardScreen(),
              ));
        });
      }
    });
  }
  bool obscurePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _visibilityLoadingScreen = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String email, password;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return flag?Scaffold(
        key: _scaffoldKey,
        body: Container(
          width: width,
          height: height,
          padding: EdgeInsets.only(top: height * 0.03),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff000000),
                  Color(0xffffffff),
                ],
              )),
          child: Center(
            child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/crm_logo_white.png',
                          width: MediaQuery.of(context).size.width * 0.8,
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Text(
                          "Login into your account",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'MontRegular',
                              fontSize: height * 0.030),
                        ),

                        SizedBox(
                          height: height * 0.08,
                        ),
                        Container(
                          width: width * 0.8,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(6.0))),
                          child: Row(
                            children: [
                              Container(
                                width: width * 0.7,
                                padding: EdgeInsets.only(left: 20, right: 15),
                                child: TextFormField(
                                  controller: emailController,
                                  cursorColor: Colors.black,
                                  decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Your Email",
                                      hintStyle: TextStyle(
                                          fontFamily: 'MontRegular',
                                          fontSize: height * 0.018)),
                                ),
                              ),
                              Container(
                                width: width * 0.05,
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          width: width * 0.8,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(6.0))),
                          child: Row(
                            children: [
                              Container(
                                width: width * 0.68,
                                padding: EdgeInsets.only(left: 20, right: 15),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  controller: passwordController,
                                  obscureText: obscurePassword,
                                  decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type your password",
                                      hintStyle: TextStyle(
                                          fontFamily: 'MontRegular',
                                          fontSize: height * 0.018)),
                                ),
                              ),
                              Container(
                                width: width * 0.05,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      obscurePassword = !obscurePassword;
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Container(
                          height: height * 0.06,
                          width: width * 0.8,
                          child: Material(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(height * 0.08)),
                            elevation: 2.0,
                            clipBehavior: Clip.antiAlias,
                            child: MaterialButton(
                              color: Colors.white,
                              splashColor: Color(0xffffffff),
                              child: Container(
                                  width: width,
                                  child: Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: height * 0.02,
                                        fontFamily: 'MontRegular',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )),
                              onPressed: () {
                                if (areValuesValid()) _login();
                              },
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                )),
          ),
        )):Center(child: CircularProgressIndicator());
  }
 
  bool areValuesValid() {
    setState(() {
      _visibilityLoadingScreen = true;
    });
    email = emailController.text.trim();
    password = passwordController.text.trim();
    if (email == "" || email.isEmpty) {
      showSnackBar("Please enter an email address");
      setState(() {
        _visibilityLoadingScreen = false;
      });
      return false;
    } else if (password == "" || password.isEmpty) {
      showSnackBar("Please enter a password");
      setState(() {
        _visibilityLoadingScreen = false;
      });
      return false;
    }
    return true;
  }

  void showSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(message)));
  }
  _login() async {
    setState(() {
      _visibilityLoadingScreen = true;
    });
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      setState(() {
        _visibilityLoadingScreen = false;
      });
      print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
    Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DashboardScreen()));
    } on FirebaseAuthException catch (e) {
      String errorMessage = "error";
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password';
      } else if (e.message == "The email address is badly formatted.") {
        errorMessage = 'Please enter a valid email address';
      } else
        errorMessage = e.message.toString();
      setState(() {
        _visibilityLoadingScreen = false;
      });
      showSnackBar(errorMessage);
    }
  }
}
