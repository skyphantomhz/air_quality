import 'package:air_quality/model/pollution.dart';
import 'package:air_quality/model/weather.dart';

class History {
  List<Weather> weather;
  List<Pollution> pollution;

  History({this.weather, this.pollution});

  History.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null) {
      weather = new List<Weather>();
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    if (json['pollution'] != null) {
      pollution = new List<Pollution>();
      json['pollution'].forEach((v) {
        pollution.add(new Pollution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weather != null) {
      data['weather'] = this.weather.map((v) => v.toJson()).toList();
    }
    if (this.pollution != null) {
      data['pollution'] = this.pollution.map((v) => v.toJson()).toList();
    }
    return data;
  }
}