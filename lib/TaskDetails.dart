import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crm_client/AssignTaskModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';

class TaskDetails extends StatefulWidget {
  AssignTaskModel taskModel = new AssignTaskModel();
  TaskDetails({Key, this.taskModel}) : super(key: Key);
  @override
  _TaskDetailsState createState() => _TaskDetailsState(taskModel);
}
class _TaskDetailsState extends State<TaskDetails> {
  var ref;
  String uuid=" ";
  final databaseReference = FirebaseDatabase.instance;
  LocationData _locationData;
  final Location location = Location();
  bool taskstartfalg=false;
    AssignTaskModel taskModel = new AssignTaskModel();
    _TaskDetailsState(AssignTaskModel taskModel) {
      this.taskModel = taskModel;
    }
  @override
  initState() {
    super.initState();
    _initLocation();
    _initFirebase();
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
  _initFirebase(){
    ref = databaseReference.reference().child('Staff');
    uuid=FirebaseAuth.instance.currentUser.uid;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
      return Scaffold(
        appBar: AppBar(
            title: Text(taskModel.taskName,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            backgroundColor: Colors.black),
        body: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 2),
              Text(taskModel.taskDescription,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100)),
              SizedBox(height: 10),
              Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Text("Date",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 2),
                      Text(taskModel.taskTime,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w100)),
                    ],
                  )),
              SizedBox(height: 10),
              Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Text("Latitude",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(height: 2),
                      Text(taskModel.latitude,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w100)),
                    ],
                  )),
              SizedBox(height: 2),
              Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Text("Longitude",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(height: 2),
                      Text(taskModel.latitude,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w100)),
                    ],
                  )),
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
                          double lat = double.parse(taskModel.latitude);
                          double long = double.parse(taskModel.longitude);
                          double _distance = calculateDistance(
                              _locationData.latitude,
                              _locationData.longitude,
                              lat,
                              long);
                          if (_distance <= 30) {

                            taskstartfalg=true;
                            Fluttertoast.showToast(msg: "Task Start");
                          } else {
                            taskstartfalg=false;
                            Fluttertoast.showToast(
                                msg: "unable to start you are out of station");
                          }
                        },
                        child: Text(
                          "Start Task",
                          style: TextStyle(color: Colors.white),
                        ),
                        splashColor: Colors.yellow,
                        color: Colors.green),
                    SizedBox(
                      width: width * 0.08,
                    ),
                    MaterialButton(
                      onPressed: () {
                        if(taskstartfalg) {
                          Fluttertoast.showToast(msg: "Task Stop");
                        }else{
                          Fluttertoast.showToast(msg: "First start a task");
                        }
                      },
                      child: Text(
                        "Stop Task",
                        style: TextStyle(color: Colors.white),
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

  double calculateDistance(lat1, lon1, lat2, lon2) {
        var p = 0.017453292519943295;
        var c = cos;
        var a = 0.5 -
            c((lat2 - lat1) * p) / 2 +
            c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
        return (12742 * asin(sqrt(a))) * 1000;
  }

}
