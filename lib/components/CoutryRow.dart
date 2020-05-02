import 'package:flutter/material.dart';
import 'package:coronaticker/model/Country.dart';

class CountryRow extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Country country;

  CountryRow({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child:
                Image.network(country.countryInfo.flag, width: 60, height: 48),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(country.name, style: _biggerFont),
                    Text('new Cases today: ${country.todayCases}')
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(child: Text('C   ${country.cases}'), width: 80),
                    Container(child: Text('D   ${country.deaths}'), width: 80),
                    Container(
                        child: Text('R   ${country.recovered}'), width: 80),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
