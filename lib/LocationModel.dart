import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';

LocationModel staffModelFromJson(String str) =>
    LocationModel.fromJson(json.decode(str));

String staffModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  double latitude;
  double longitude;

  LocationModel({
    this.latitude,
    this.longitude,
  });

  LocationModel.fromSnapshot(DataSnapshot map)
      : latitude = map.value["latitude"],
        longitude = map.value["longitude"];

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      LocationModel(latitude: json["latitude"], longitude: json["longitude"]);

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
