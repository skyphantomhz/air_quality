import 'package:air_quality/model/search_location/city.dart';

class Cities {
  String dt;
  String term;
  List<City> results;

  Cities({this.dt, this.term, this.results});

  Cities.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    term = json['term'];
    if (json['results'] != null) {
      results = new List<City>();
      json['results'].forEach((v) {
        results.add(new City.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['term'] = this.term;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}