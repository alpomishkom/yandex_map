import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FlutterLocation extends StatefulWidget {
  const FlutterLocation({super.key});

  @override
  State<FlutterLocation> createState() => _FlutterLocationState();
}

class _FlutterLocationState extends State<FlutterLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
                initialCenter: LatLng(41.3260977, 69.228153), initialZoom: 10),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              const RichAttributionWidget(
                attributions: [],
              )
            ],
          ),
          const Positioned(left: 0,right: 0,bottom: 0,top: 0,child: Icon(Icons.location_on_sharp,color: Colors.red,size: 30,))
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () async {},
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.location_on_sharp),
          ),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            onPressed: () async {},
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
