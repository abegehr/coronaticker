import 'package:flutter/material.dart';
import 'package:coronaticker/components/CountriesList.dart';

class CountriesPage extends StatelessWidget {
  CountriesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: CountriesList()),
    );
  }
}
