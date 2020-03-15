import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  Future<List<Country>> fetchData() async {
    final response = await http.get('https://corona.lmao.ninja/countries');

    print(response);

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Country>((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Country>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? _buildList(snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildList(data) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i < data.length) {
            return _buildRow(data[i]);
          }
          return null;
        });
  }

  Widget _buildRow(Country country) {
    return CountryRow(country: country);
  }
}

class CountryRow extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Country country;

  CountryRow({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        country.toString(),
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
      name: json['country'],
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      todayDeaths: json['todayDeaths'],
      recovered: json['recovered'],
      critical: json['critical'],
    );
  }

  Map<String, dynamic> toJson() => {
        'country': name,
        'cases': cases,
        'todayCases': todayCases,
        'deaths': deaths,
        'todayDeaths': todayDeaths,
        'recovered': recovered,
        'critical': critical,
      };

  @override
  String toString() => json.encode(toJson());
}
