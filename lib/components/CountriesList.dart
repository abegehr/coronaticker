import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:coronaticker/model/Country.dart';
import 'package:coronaticker/components/CoutryRow.dart';

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
