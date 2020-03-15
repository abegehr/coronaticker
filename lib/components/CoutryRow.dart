import 'package:flutter/material.dart';
import 'package:coronaticker/model/Country.dart';

class CountryRow extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Country country;

  CountryRow({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset("assets/images/flags/china.png"),
        title: Text(
          country.toString(),
          style: _biggerFont,
        ),
        onTap: () => print("Tapped ${country.name}"));
  }
}
