import 'package:flutter/material.dart';
import 'package:coronaticker/model/Country.dart';

class CountryRow extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Country country;

  CountryRow({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Image.asset("assets/images/flags/china.png", width: 60, height: 48),
      Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                country.name.toString(),
                style: _biggerFont,
              ),
              Row(
                children: <Widget>[
                  Text('new Cases today'),
                  Text(
                    country.todayCases.toString(),
                  )
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('C'),
                  Text(country.cases.toString()),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('D'),
                  Text(country.deaths.toString()),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('R'),
                  Text(country.recovered.toString()),
                ],
              )
            ],
          ),
        ],
      )
    ]);
  }
}
