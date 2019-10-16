import 'package:air_quality/model/pollution.dart';
import 'package:air_quality/model/weather.dart';

class Current {
  Weather weather;
  Pollution pollution;

  Current({this.weather, this.pollution});

  Current.fromJson(Map<String, dynamic> json) {
    weather =
        json['weather'] != null ? new Weather.fromJson(json['weather']) : null;
    pollution = json['pollution'] != null
        ? new Pollution.fromJson(json['pollution'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weather != null) {
      data['weather'] = this.weather.toJson();
    }
    if (this.pollution != null) {
      data['pollution'] = this.pollution.toJson();
    }
    return data;
  }
}