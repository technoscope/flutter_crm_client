import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crm_client/LocationModel.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'main.dart';
class MapScreen extends StatefulWidget {
  @override
  MapSampleState createState() => MapSampleState();
}

class MapSampleState extends State<MapScreen> {
  static bool mapFlag = false;
  final databaseReference = FirebaseDatabase.instance;
  static var latitude = 24.774265;
  static var longitude = 39.172779;
  double _originLatitude =33.62630421068799, _originLongitude = 73.06946408294556;
  double _destLatitude = 33.680168714871236, _destLongitude = 73.09925328025098;
  static Map map;
  String uuid;
  var now;
  List<String> keys=new List();
  var ref;
  var formatter;
  var databaseReferencee;
  String googleAPiKey="AIzaSyBPKo0E3nwCWuaZsoZNAfJENCGkFy-J0uY";
  String formattedDate;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = new List();
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(latitude, longitude),
    zoom: 14.4746,
  );
  GoogleMapController mapController;
  List<LocationModel> listlist=new List();
  @override
  void initState() {
    // _getlocation();
    _initfirebase();
    _setMarker();

  }

  _initfirebase() {
    now = new DateTime.now();
    formatter = new DateFormat('yyyy-MM-dd');
    formattedDate = formatter.format(now);
    uuid = FirebaseAuth.instance.currentUser.uid.toString();
    ref = databaseReference.reference().child('Staff');
    _getlatlngList();
    _addMarker(LatLng(_originLatitude, _originLongitude), "origin",
        BitmapDescriptor.defaultMarker);
    /// destination marker
    _addMarker(LatLng(_destLatitude, _destLongitude), "destination",
        BitmapDescriptor.defaultMarkerWithHue(90));
    _getPolyline();

  }

  _getlatlngList() async {
    databaseReferencee = FirebaseDatabase.instance;
    var sref = await FirebaseDatabase.instance.reference()
        .child('Staff')
        .child(uuid)
        .child('Tracking')
        .child(formattedDate)
        .once();
    sref.value.forEach((key, values) => keys.add(key));
    await Future.delayed(const Duration(seconds: 1));
    _latlngList();
  }
  _latlngList() async{
   List<LocationModel> models=new List();
    for(int i=0;i<keys.length;i++){
      ref = databaseReference.reference().child('Staff');
        await  ref.child(uuid)
          .child('Tracking')
          .child(formattedDate)
          .child(keys[i])
          .once().then((DataSnapshot snapshot){
          models.add(LocationModel.fromSnapshot(snapshot));
          Map map=snapshot.value;
          setState(() {
            polylineCoordinates.add(LatLng(map['latitude'], map['longitude']));
          });
      });
    }
    setState(() {
      mapFlag=true;
    });
  }
  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }
  _getPolyline() async {
    polylineCoordinates.add(LatLng(33.62630421068799, 73.06946408294556));
    polylineCoordinates.add(LatLng(33.63003835312387, 73.07171713851976));
    polylineCoordinates.add(LatLng(33.62630421068799, 73.06946408294556));
    polylineCoordinates.add(LatLng(33.63421003851413, 73.07388436338832));
    polylineCoordinates.add(LatLng(33.63863162577334, 73.075590248319));
    polylineCoordinates.add(LatLng(33.645803940033844, 73.07839583893927));
    polylineCoordinates.add(LatLng(33.65347131377997, 73.08147501490738));
    polylineCoordinates.add(LatLng(33.680168714871236, 73.09925328025098));
    _addPolyLine();
  }
  _addPolyLine() {
    setState(() {
      PolylineId id = PolylineId("poly");
      Polyline polyline = Polyline(
          polylineId: id, color: Colors.red, points: polylineCoordinates);
      polylines[id] = polyline;
    });
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    // _getlocation();
    return new Scaffold(
      body:
      //mapFlag?
      SafeArea(
        child: Scaffold(
            body: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(_originLatitude, _originLongitude), zoom: 15),
              myLocationEnabled: true,
              tiltGesturesEnabled: true,
              compassEnabled: true,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              onMapCreated: _onMapCreated,
              markers: Set<Marker>.of(markers.values),
              polylines: Set<Polyline>.of(polylines.values),
            )),
      )
      //     ? GoogleMap(
      //   initialCameraPosition: CameraPosition(
      //     target: LatLng(latitude, longitude),
      //     zoom: 17.4746,
      //   ),
      //   onMapCreated: (GoogleMapController controller) {
      //     _controller.complete(controller);
      //   },
      //   markers: _markers,
      //   mapType: MapType.normal,
      //   //,
      // )
      //     : Container(
      //   alignment: Alignment.center,
      //   child: CircularProgressIndicator(),
      // )
    ,
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
            height: 120,
            margin: EdgeInsets.only(left: height * 0.04, bottom: height * 0.03),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: FloatingActionButton.extended(
                    onPressed: () async {
                      // Add your onPressed code here!
                      // _getlocation();
                      _setMarker();
                      _gotoCurrentPosition();
                      //_gotoCurrentPosition();
                    },
                    label: const Text(
                      'My Location',
                      style: TextStyle(
                          fontFamily: 'MontRegular', color: Colors.black),
                    ),
                    icon: const Icon(
                      Icons.my_location,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),),
                SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        // Add your onPressed code here!
                        // _LockLocation();
                        //_gotoCurrentPosition();
                      },
                      label: const Text(
                        'Start Tracking',
                        style: TextStyle(
                            fontFamily: 'MontRegular', color: Colors.black),
                      ),
                      icon: const Icon(
                        Icons.my_location,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                    )),
              ],
            )),
      ),
    );
  }
  _setMarker() {
    _kGooglePlex = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 14.4746,
    );
    Marker marker = Marker(
      markerId: MarkerId("1"),
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(
        title: 'My Location',
      ),
      icon: BitmapDescriptor.defaultMarker,
    );
    // _markers= {};
    setState(() {
      _markers = new Set();
      _markers.add(marker);
      //_controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
    });
  }
  Future<void> _goToTheLake(CameraPosition _kLake) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
  void _gotoCurrentPosition() {
    CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(latitude, longitude),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414
    );
    _goToTheLake(_kLake);
  }
}
