import 'package:air_quality/model/base_model.dart';
import 'package:air_quality/model/currency.dart';
import 'package:air_quality/model/forecasts.dart';
import 'package:air_quality/model/history.dart';
import 'package:air_quality/model/location.dart';

class City extends BaseModel{
  String city;
  String state;
  String country;
  Location location;
  List<Forecasts> forecasts;
  Current current;
  History history;

  City(
      {this.city,
      this.state,
      this.country,
      this.location,
      this.forecasts,
      this.current,
      this.history});

  City.fromJson(Map<String, dynamic> json) {
    print("city: $json");
    city = json['city'];
    state = json['state'];
    country = json['country'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    if (json['forecasts'] != null) {
      forecasts = new List<Forecasts>();
      json['forecasts'].forEach((v) {
        forecasts.add(new Forecasts.fromJson(v));
      });
    }
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
    history =
        json['history'] != null ? new History.fromJson(json['history']) : null;
  }

@override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.forecasts != null) {
      data['forecasts'] = this.forecasts.map((v) => v.toJson()).toList();
    }
    if (this.current != null) {
      data['current'] = this.current.toJson();
    }
    if (this.history != null) {
      data['history'] = this.history.toJson();
    }
    return data;
  }
}