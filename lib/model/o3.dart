class O3 {
  int conc;
  int aqius;
  int aqicn;

  O3({this.conc, this.aqius, this.aqicn});

  O3.fromJson(Map<String, dynamic> json) {
    conc = json['conc'];
    aqius = json['aqius'];
    aqicn = json['aqicn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['conc'] = this.conc;
    data['aqius'] = this.aqius;
    data['aqicn'] = this.aqicn;
    return data;
  }
}