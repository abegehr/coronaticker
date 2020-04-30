import 'dart:convert';

class Country {
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
    /*
    // Example json data:
      {
        "updated":1588239096243,
        "country":"USA",
        "countryInfo":
        {
          "_id":840,
          "iso2":"US",
          "iso3":"USA",
          "lat":38,
          "long":-97,
          "flag":"https://corona.lmao.ninja/assets/img/flags/us.png"
        },
        "cases":1064572,
        "todayCases":378,
        "deaths":61669,
        "todayDeaths":13,
        "recovered":147411,
        "active":855492,
        "critical":18671,
        "casesPerOneMillion":3216,
        "deathsPerOneMillion":186,
        "tests":6139911,
        "testsPerOneMillion":18549,
        "continent":"North America"
      }
    */

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
