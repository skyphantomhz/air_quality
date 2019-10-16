import 'package:air_quality/model/o3.dart';

class Pollution {
  String ts;
  int aqius;
  String mainus;
  int aqicn;
  String maincn;
  O3 o3;

  Pollution(
      {this.ts, this.aqius, this.mainus, this.aqicn, this.maincn, this.o3});

  Pollution.fromJson(Map<String, dynamic> json) {
    ts = json['ts'];
    aqius = json['aqius'];
    mainus = json['mainus'];
    aqicn = json['aqicn'];
    maincn = json['maincn'];
    o3 = json['o3'] != null ? new O3.fromJson(json['o3']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ts'] = this.ts;
    data['aqius'] = this.aqius;
    data['mainus'] = this.mainus;
    data['aqicn'] = this.aqicn;
    data['maincn'] = this.maincn;
    if (this.o3 != null) {
      data['o3'] = this.o3.toJson();
    }
    return data;
  }
}