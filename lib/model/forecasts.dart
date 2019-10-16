class Forecasts {
  String ts;
  int aqius;
  int aqicn;
  int tp;
  int tpMin;
  int pr;
  int hu;
  int ws;
  int wd;
  String ic;

  Forecasts(
      {this.ts,
      this.aqius,
      this.aqicn,
      this.tp,
      this.tpMin,
      this.pr,
      this.hu,
      this.ws,
      this.wd,
      this.ic});

  Forecasts.fromJson(Map<String, dynamic> json) {
    ts = json['ts'];
    aqius = json['aqius'];
    aqicn = json['aqicn'];
    tp = json['tp'];
    tpMin = json['tp_min'];
    pr = json['pr'];
    hu = json['hu'];
    ws = json['ws'];
    wd = json['wd'];
    ic = json['ic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ts'] = this.ts;
    data['aqius'] = this.aqius;
    data['aqicn'] = this.aqicn;
    data['tp'] = this.tp;
    data['tp_min'] = this.tpMin;
    data['pr'] = this.pr;
    data['hu'] = this.hu;
    data['ws'] = this.ws;
    data['wd'] = this.wd;
    data['ic'] = this.ic;
    return data;
  }
}