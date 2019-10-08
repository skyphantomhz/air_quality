import 'package:air_quality/model/attribution_data.dart';

class Iaqi {
  AttributionData co;
  AttributionData h;
  AttributionData no2;
  AttributionData o3;
  AttributionData p;
  AttributionData pm10;
  AttributionData pm25;
  AttributionData so2;
  AttributionData t;
  AttributionData w;

  Iaqi(
      {this.co,
      this.h,
      this.no2,
      this.o3,
      this.p,
      this.pm10,
      this.pm25,
      this.so2,
      this.t,
      this.w});

  Iaqi.fromJson(Map<String, dynamic> json) {
    co = json['co'] != null ? new AttributionData.fromJson(json['co']) : null;
    h = json['h'] != null ? new AttributionData.fromJson(json['h']) : null;
    no2 =
        json['no2'] != null ? new AttributionData.fromJson(json['no2']) : null;
    o3 = json['o3'] != null ? new AttributionData.fromJson(json['o3']) : null;
    p = json['p'] != null ? new AttributionData.fromJson(json['p']) : null;
    pm10 = json['pm10'] != null
        ? new AttributionData.fromJson(json['pm10'])
        : null;
    pm25 = json['pm25'] != null
        ? new AttributionData.fromJson(json['pm25'])
        : null;
    so2 =
        json['so2'] != null ? new AttributionData.fromJson(json['so2']) : null;
    t = json['t'] != null ? new AttributionData.fromJson(json['t']) : null;
    w = json['w'] != null ? new AttributionData.fromJson(json['w']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.co != null) {
      data['co'] = this.co.toJson();
    }
    if (this.h != null) {
      data['h'] = this.h.toJson();
    }
    if (this.no2 != null) {
      data['no2'] = this.no2.toJson();
    }
    if (this.o3 != null) {
      data['o3'] = this.o3.toJson();
    }
    if (this.p != null) {
      data['p'] = this.p.toJson();
    }
    if (this.pm10 != null) {
      data['pm10'] = this.pm10.toJson();
    }
    if (this.pm25 != null) {
      data['pm25'] = this.pm25.toJson();
    }
    if (this.so2 != null) {
      data['so2'] = this.so2.toJson();
    }
    if (this.t != null) {
      data['t'] = this.t.toJson();
    }
    if (this.w != null) {
      data['w'] = this.w.toJson();
    }
    return data;
  }
}
