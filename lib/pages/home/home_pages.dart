import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../data/data.dart';
import '../../sercice/service.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final mapControllerCompleter = Completer<YandexMapController>();
  late YandexMapController yandexMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          YandexMap(
            onMapCreated: (controller) {
              mapControllerCompleter.complete(controller);
            },
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Icon(
              Icons.location_on_sharp,
              color: Colors.red,
              size: 40,
            ),
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () async {
              (await mapControllerCompleter.future).moveCamera(
                  CameraUpdate.zoomOut()
              );
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            onPressed: () {
              _fetchCurrentLocation();
            },
            child: const Icon(Icons.location_on_sharp),
          ),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            onPressed: () async {
              (await mapControllerCompleter.future).moveCamera(
                CameraUpdate.zoomIn()
              );
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    var defLocation =   const UzbekstonLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    _moveToCurrentLocation(location);
  }

  Future<void> _moveToCurrentLocation(AppLatLong appLatLong,) async {
    (await mapControllerCompleter.future).moveCamera(

      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 18,
        ),
      ),
    );
  }
}
