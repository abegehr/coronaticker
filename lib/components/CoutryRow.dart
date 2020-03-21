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
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Image.asset("assets/images/flags/china.png",
                  width: 60, height: 48),
            )),
        Expanded(
          flex: 4,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      country.name.toString(),
                      style: _biggerFont,
                    ),
                    Row(
                      children: <Widget>[
                        Text('new Cases today:'),
                        Text(
                          country.todayCases.toString(),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 72,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('C'),
                          Text(country.cases.toString()),
                        ],
                      ),
                    ),
                    Container(
                      width: 72,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('D'),
                          Text(country.deaths.toString()),
                        ],
                      ),
                    ),
                    Container(
                      width: 72,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('R'),
                          Text(country.recovered.toString()),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
