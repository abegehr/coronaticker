import 'package:flutter/material.dart';
import 'package:coronaticker/model/Country.dart';

class CountryRow extends StatelessWidget {
  final Country country;

  const CountryRow({
    Key key,
    this.country,
    this.name,
    this.cases,
    this.todayCases,
  });

  final String name;
  final int cases;
  final int todayCases;
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _smallerFont = const TextStyle(fontSize: 14.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset("assets/images/flags/china.png"),
            ),
            Expanded(
                flex: 9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      country.name,
                      style: _biggerFont,
                    ),
                    Expanded(
                        flex: 1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    country.todayCases.toString(),
                                    style: _smallerFont,
                                  ),
                                  Text(
                                    country.cases.toString(),
                                    style: _biggerFont,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    country.todayCases.toString(),
                                    style: _smallerFont,
                                  ),
                                  Text(
                                    country.cases.toString(),
                                    style: _biggerFont,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    country.todayCases.toString(),
                                    style: _smallerFont,
                                  ),
                                  Text(
                                    country.cases.toString(),
                                    style: _biggerFont,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                )),
          ],
        ));
  }
}
