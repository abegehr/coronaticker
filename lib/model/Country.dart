import 'dart:convert';

class CountryInfo {
  final int id;
  final String iso2;
  final String iso3;
  final double lat;
  final double long;
  final String flag;

  CountryInfo({
    this.id,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    /*
    // Example json data:
      {
        "_id":840,
        "iso2":"US",
        "iso3":"USA",
        "lat":38,
        "long":-97,
        "flag":"https://corona.lmao.ninja/assets/img/flags/us.png"
      }
    */
    return CountryInfo(
      id: json["_id"],
      iso2: json["iso2"],
      iso3: json["iso3"],
      lat: json["lat"],
      long: json["long"],
      flag: json["flag"],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'iso2': iso2,
        'iso3': iso3,
        'lat': lat,
        'long': long,
        'flag': flag,
      };

  @override
  String toString() => json.encode(toJson());
}

class Country {
  final int updated;
  // meta data
  final String name;
  final String continent;
  final CountryInfo countryInfo;
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
      countryInfo: CountryInfo.fromJson(json["countryInfo"]),
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
        'updated': updated,
        // meta data
        'country': name,
        'continent': continent,
        'countryInfo': countryInfo.toJson(),
        // corona data
        'cases': cases,
        'todayCases': todayCases,
        'deaths': deaths,
        'todayDeaths': todayDeaths,
        'recovered': recovered,
        'active': active,
        'critical': critical,
        'casesPerOneMillion': casesPerOneMillion,
        'deathsPerOneMillion': deathsPerOneMillion,
        'tests': tests,
        'testsPerOneMillion': testsPerOneMillion,
      };

  @override
  String toString() => json.encode(toJson());
}
