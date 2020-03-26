import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:coronaticker/pages/CountriesPage.dart';

void main() {
  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoronaTicker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountriesPage(title: 'CoronaTicker'),
    );
  }
}
