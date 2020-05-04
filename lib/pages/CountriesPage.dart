import 'dart:html';

import 'package:flutter/material.dart';
import 'package:coronaticker/components/CountriesList.dart';
import 'package:url_launcher/url_launcher.dart';

launchImpressum() async {
  const url = 'https://places.rocks/impressum';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class CountriesPage extends StatelessWidget {
  CountriesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          RaisedButton(
            color: Colors.transparent,
            onPressed: launchImpressum,
            child: Text(
              'Impressum',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: CountriesList()),
          Text(
            "© Places Rocks UG. The displayed data is sourced client-side directly from https://corona.lmao.ninja/. CoronaTicker.live cannot guarantee for accuracy of the provided data.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
