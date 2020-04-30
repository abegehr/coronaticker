import 'dart:convert';

class Country {
  final int updated;
  // meta data
  final String name;
  final String continent;
  final Map<String, dynamic> countryInfo;
  // corona data
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int active;
  final int critical;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;
  final int tests;
  final int testsPerOneMillion;

  Country({
    this.updated,
    this.name,
    this.continent,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
  });

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
      updated: json["updated"],
      // meta data
      name: json['country'],
      continent: json["continent"],
      countryInfo: {
        "_id": json['countryInfo']["_id"],
        "iso2": json['countryInfo']["iso2"],
        "iso3": json['countryInfo']["iso3"],
        "lat": json['countryInfo']["lat"],
        "long": json['countryInfo']["long"],
        "flag": json['countryInfo']["flag"],
      },
      // corona data
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      todayDeaths: json['todayDeaths'],
      recovered: json['recovered'],
      active: json['active'],
      critical: json['critical'],
      casesPerOneMillion: json['casesPerOneMillion'],
      deathsPerOneMillion: json["deathsPerOneMillion"],
      tests: json["tests"],
      testsPerOneMillion: json["testsPerOneMillion"],
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
