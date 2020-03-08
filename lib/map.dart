import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
void main() => runApp(MapView());

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyMap(),
    );
  }
}

class MyMap extends StatefulWidget {
  @override

  State<MyMap> createState() => MyMapSampleState();
}

final Map<String, Marker> _markers = {};
class MyMapSampleState extends State<MyMap> {
  Completer<GoogleMapController> _controller = Completer();
  static LatLng _initialPosition;
  static  LatLng _lastMapPosition = _initialPosition;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      print('${placemark[0].name}');
    });

    setState(() async {
      final GoogleMapController controller = await _controller.future;
      _markers.clear();

      final marker = Marker(
        markerId: MarkerId("curr_loc"),
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(title: 'Your Location'),
      );
      _markers["Current Location"] = marker;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(currentLocation.latitude, currentLocation.longitude) )));
    });
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: getLocation,
        tooltip: 'Get Location',
        child: Icon(Icons.map),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {

          _controller.complete(controller);
        },
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(40.688841, -74.044015),
          zoom: 50,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }
}