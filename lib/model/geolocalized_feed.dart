import 'package:air_quality/model/attribution.dart';
import 'package:air_quality/model/city.dart';
import 'package:air_quality/model/debug.dart';
import 'package:air_quality/model/iaqi.dart';
import 'package:air_quality/model/time.dart';
import 'base_model.dart';

class GeolocalizedFeed extends BaseModel {
  int aqi;
  int idx;
  List<Attribution> attributions;
  City city;
  String dominentpol;
  Iaqi iaqi;
  Time time;
  Debug debug;

  GeolocalizedFeed(
      {this.aqi,
      this.idx,
      this.attributions,
      this.city,
      this.dominentpol,
      this.iaqi,
      this.time,
      this.debug});

  GeolocalizedFeed.fromJson(Map<String, dynamic> json) {
    aqi = json['aqi'];
    idx = json['idx'];
    if (json['attributions'] != null) {
      attributions = new List<Attribution>();
      json['attributions'].forEach((v) {
        attributions.add(new Attribution.fromJson(v));
      });
    }
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    dominentpol = json['dominentpol'];
    iaqi = json['iaqi'] != null ? new Iaqi.fromJson(json['iaqi']) : null;
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    debug = json['debug'] != null ? new Debug.fromJson(json['debug']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aqi'] = this.aqi;
    data['idx'] = this.idx;
    if (this.attributions != null) {
      data['attributions'] = this.attributions.map((v) => v.toJson()).toList();
    }
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    data['dominentpol'] = this.dominentpol;
    if (this.iaqi != null) {
      data['iaqi'] = this.iaqi.toJson();
    }
    if (this.time != null) {
      data['time'] = this.time.toJson();
    }
    if (this.debug != null) {
      data['debug'] = this.debug.toJson();
    }
    return data;
  }
}
