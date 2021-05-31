import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:responsive_app/pages/home/home_page.dart';

void main() {
  // runApp(DevicePreview(builder: (_) => MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // builder: DevicePreview.appBuilder,
      // locale: DevicePreview.locale(context),
      home: HomePage(),
    );
  }
}