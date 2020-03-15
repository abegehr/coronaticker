import 'package:flutter/material.dart';
import 'package:coronaticker/pages/CountriesPage.dart';

void main() => runApp(MyApp());

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
