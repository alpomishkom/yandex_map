import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yandex_map/pages/home/flutter_map.dart';
import 'package:yandex_map/provaider/provaider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => VMCController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterLocation(),
    );
  }
}
