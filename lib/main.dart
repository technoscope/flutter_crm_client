import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'login.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashIconSize: 200,
        duration: 3000,
        splash: Image(
          image: AssetImage("assets/logo.png"),
          alignment: Alignment.center,
        ),
        nextScreen: login(),
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white,
      ),
    );
  }
}
// class MyApp2 extends StatefulWidget {
//   MyApp2({Key key}) : super(key: key);
//   _MyAppState createState() => _MyAppState();
// }
// class _MyAppState extends State<MyApp2> {
//   var databaseReference;
//   var ref;
//   @override
//   Widget build(BuildContext context) {
//     setState(() {
//       Firebase.initializeApp();
//     });
//     return Container();
//   }
  // _staffstatus(String uuid) async {
  //   ref = databaseReference.reference().child('Staff');
  //   await ref
  //       .child(uuid)
  //       .once()
  //       .then((DataSnapshot snapshot) {
  //     String isblook = snapshot.value["Status"];
  //     if (isblook == "true") {
  //
  //     } else {
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => login(),
  //           ));
  //     }
  //   });
  // }

//   @override
//   void initState() {
//     setState(() {
//       Firebase.initializeApp();
//
//     });
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => login(),
//         ));
//     // String uuid = FirebaseAuth.instance.currentUser.uid;
//     // if (uuid != null) {
//     //   _staffstatus(uuid);
//     // }else {
//     //   Navigator.push(
//     //       context,
//     //       MaterialPageRoute(
//     //         builder: (context) => login(),
//     //       ));
//     // }
//   }
// }
