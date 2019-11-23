import 'package:air_quality/model/o3.dart';
import 'package:flutter/material.dart';

class Pollution {
  String ts;
  int aqius;
  String mainus;
  int aqicn;
  String maincn;
  WeatherProperty p2;
  WeatherProperty p1;
  WeatherProperty o3;
  WeatherProperty n2;
  WeatherProperty s2;
  WeatherProperty co;

  Pollution(
      {this.ts, this.aqius, this.mainus, this.aqicn, this.maincn, this.o3});

  Pollution.fromJson(Map<String, dynamic> json) {
    ts = json['ts'];
    aqius = json['aqius'];
    mainus = json['mainus'];
    aqicn = json['aqicn'];
    maincn = json['maincn'];
    p2 = json['p2'] != null ? new WeatherProperty.fromJson(json['p2']) : null;
    p1 = json['p1'] != null ? new WeatherProperty.fromJson(json['p1']) : null;
    o3 = json['o3'] != null ? new WeatherProperty.fromJson(json['o3']) : null;
    n2 = json['n2'] != null ? new WeatherProperty.fromJson(json['n2']) : null;
    s2 = json['s2'] != null ? new WeatherProperty.fromJson(json['s2']) : null;
    co = json['co'] != null ? new WeatherProperty.fromJson(json['co']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ts'] = this.ts;
    data['aqius'] = this.aqius;
    data['mainus'] = this.mainus;
    data['aqicn'] = this.aqicn;
    data['maincn'] = this.maincn;
    if (this.p2 != null) {
      data['p2'] = this.p2.toJson();
    }
    if (this.p1 != null) {
      data['p1'] = this.p1.toJson();
    }
    if (this.o3 != null) {
      data['o3'] = this.o3.toJson();
    }
    if (this.n2 != null) {
      data['n2'] = this.n2.toJson();
    }
    if (this.s2 != null) {
      data['s2'] = this.s2.toJson();
    }
    if (this.co != null) {
      data['co'] = this.co.toJson();
    }
    return data;
  }
}