import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crm_client/LocationModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
class Attendance extends StatefulWidget {
  Attendance({Key key}) : super(key: key);
  @override
  _AttendanceState createState() => _AttendanceState();
}
class _AttendanceState extends State<Attendance> {
  String checkInTime = " ";
  String checkOutTime = " ";
  String shortBreak = " ";
  bool flag = false;
  bool locationflag=false;
  Map map;
  var ref;
  final databaseReference = FirebaseDatabase.instance;
  String uuid;
  var now;
  var formatter;
  LocationData _locationData;
  final Location location = Location();
  String formattedDate;
  String formattedTime;
  @override
  void initState() {
    _initLocation();
    initfirebase();
  }
  _initLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
  }
  initfirebase() {
    now = new DateTime.now();
    formatter = new DateFormat('yyyy-MM-dd');
    formattedDate = formatter.format(now);
    flag = true;
    uuid = FirebaseAuth.instance.currentUser.uid.toString();
    ref = databaseReference.reference().child('Staff');
    _getFirebaseChecks();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Attendance"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: Center(
                  child: Text(checkInTime,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),

            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: Center(
                  child: Text(shortBreak,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: Center(
                  child: Text(checkOutTime,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Expanded(
                child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.04,
                  ),
                  MaterialButton(
                      onPressed: () {
                        _checkin();
                      },
                      child: Text(
                        "Check in",
                        style: TextStyle(color:Colors.white),

                      ),
                      splashColor: Colors.yellow,
                      color: Colors.green),
                  SizedBox(
                    width: width * 0.08,
                  ),
                  MaterialButton(
                      onPressed: () {
                        _Break();
                      },
                      child: Text(
                        "Break",
                        style: TextStyle(color:Colors.white),
                      ),
                      splashColor: Colors.yellow,
                      color: Colors.blueGrey),
                  SizedBox(
                    width: width * 0.08,
                  ),
                  MaterialButton(
                    onPressed: () {
                      _checkout();
                    },
                    child: Text(
                      "Check out",
                      style: TextStyle(color:Colors.white),

                    ),
                    splashColor: Colors.yellow,
                    color: Colors.red,
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  _Break() {
    formatter = new DateFormat('hh:mm a');
    formattedTime = formatter.format(now);
    setState(() async {
      await ref
          .child(uuid)
          .child("Attendance")
          .child(formattedDate)
          .child("Break")
          .once()
          .then((DataSnapshot snapshot) {
            String check=snapshot.value;
        if (check != null) {
          Fluttertoast.showToast(msg: "we have already had break");
        } else {
          setState(() {
            shortBreak = "Short Break at $formattedDate $formattedTime";
          });
          ref
              .child(uuid)
              .child("Attendance")
              .child(formattedDate)
              .child("Break")
              .set("Break at: $formattedDate $formattedTime");
        }
      });
    });
  }
  _checkin() {
    formatter = new DateFormat('hh:mm a');
    formattedTime = formatter.format(now);
    setState(() async {
      await ref
          .child(uuid)
          .child("Attendance")
          .child(formattedDate)
          .child("checkIn")
          .once()
          .then((DataSnapshot snapshot) {
            String check=snapshot.value;
        if (check != null) {
          Fluttertoast.showToast(msg: "Already checkIn");
        } else {
          setState(() {
            checkInTime = "Check In at $formattedDate $formattedTime";
          });
          ref.child(uuid)
              .child("Attendance")
              .child(formattedDate)
              .child("checkIn")
              .set("Check In at: $formattedDate $formattedTime");
          location.onLocationChanged.listen((LocationData currentLocation) {
            if (locationflag ==false) {
            var mapLocation = {
              "latitude": currentLocation.latitude,
              "longitude": currentLocation.longitude
            };
            // Use current location
            ref.child(uuid)
                .child("Tracking").child(formattedDate).push()
                .set(mapLocation);
            // Fluttertoast.showToast(msg: currentLocation.latitude.toString());
          }
          });
          location.enableBackgroundMode(enable: true);
        }
      });
    });
  }
  _checkout() {
    formatter = new DateFormat('hh:mm a');
    formattedTime = formatter.format(now);
    ref = databaseReference.reference().child('Staff');
    setState(() async {
      await ref
          .child(uuid)
          .child("Attendance")
          .child(formattedDate)
          .child("checkOut")
          .once()
          .then((DataSnapshot snapshot) {
        String check=snapshot.value;
        if (check != null) {
          Fluttertoast.showToast(msg: "Already checkout");
        } else {
      setState(() {
        checkOutTime = "Check Out at $formattedDate $formattedTime";
        locationflag=true;
      });
          ref.child(uuid)
              .child("Attendance")
              .child(formattedDate)
              .child("checkOut")
              .set("Check Out at: $formattedDate $formattedTime");
          location.enableBackgroundMode(enable: false);
          if(locationflag==true){
            Fluttertoast.showToast(msg: "Location Tracker is Stop");
          }
        }
      });
    });
  }
  _getFirebaseChecks() async {
      ref = databaseReference.reference().child('Staff');
      await ref
          .child(uuid)
          .child("Attendance")
          .child(formattedDate)
          .once()
          .then((DataSnapshot snapshot) {
        map = snapshot.value;
        setState(() {
          if(map['checkIn']!=null) {
            checkInTime = map['checkIn'];
          }
          if(map['checkOut']!=null) {
            checkOutTime = map['checkOut'];
          }
          if(map['Break']!=null){
            shortBreak = map['Break'];
          }
        });
      });
  }
}