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
