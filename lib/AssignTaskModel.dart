import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

AssignTaskModel staffModelFromJson(String str) =>
    AssignTaskModel.fromJson(json.decode(str));
String AssignTaskModelToJson(AssignTaskModel data) => json.encode(data.toJson());

class AssignTaskModel {
  String taskName;
  String taskDescription;
  String taskDate;
  String taskTime;
  String latitude;
  String longitude;
  String key;
  String taskStatus;
  AssignTaskModel({
    this.taskName,
    this.taskDescription,
    this.taskDate,
    this.taskTime,
    this.latitude,
    this.longitude,
    this.key,
    this.taskStatus
  });

  AssignTaskModel.fromSnapshot(DataSnapshot map) :
        taskName=map.value["taskName"],
        taskDescription = map.value["taskDescription"],
        taskDate=map.value["taskDate"],
        taskTime=map.value["taskTime"],
        latitude=map.value["latitude"],
        longitude=map.value["longitude"],
        key=map.value["key"],
        taskStatus=map.value["taskStatus"];


  factory AssignTaskModel.fromJson(Map<String, dynamic> json) => AssignTaskModel(
        taskName:json["taskName"],
        taskDescription:json["taskDescription"],
        taskDate:json["taskDate"],
        taskTime:json["taskTime"],
        latitude:json["latitude"],
        longitude: json["longitude"],
        key:json["key"],
        taskStatus:json["taskStatus"]
  );

Map<String, dynamic> toJson()=>{
  "taskName":taskName,
  "taskDescription":taskDescription,
  "taskDate":taskDate,
  "taskTime":taskTime,
  "latitude":latitude,
  "longitude":longitude,
  "key":key,
  "taskStatus":taskStatus
};
}