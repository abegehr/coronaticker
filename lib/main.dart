import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoronaTicker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'CoronaTicker'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

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

class CountriesList extends StatefulWidget {
  @override
  CountriesListState createState() => CountriesListState();
}

class CountriesListState extends State<CountriesList> {
  final _data = [];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Future<http.Response> fetchData() {
    return http.get('https://corona.lmao.ninja/countries');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i < _data.length) {
            return _buildRow(_data[i]);
          }
          return null;
        });
  }

  Widget _buildRow(countryEntry) {
    return ListTile(
      title: Text(
        countryEntry,
        style: _biggerFont,
      ),
    );
  }
}

class Country {
  // {"country":"China","cases":80849,"todayCases":25,"deaths":3199,"todayDeaths":10,"recovered":66915,"critical":3226}
  final String name;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int critical;

  Country(
      {this.name,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.critical});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      todayDeaths: json['todayDeaths'],
      recovered: json['recovered'],
      critical: json['critical'],
    );
  }
}
