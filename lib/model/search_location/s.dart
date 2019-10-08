class S {
  String a;
  List<String> t;
  List<String> n;
  String u;

  S({this.a, this.t, this.n, this.u});

  S.fromJson(Map<String, dynamic> json) {
    a = json['a'];
    t = json['t'].cast<String>();
    n = json['n'].cast<String>();
    u = json['u'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['a'] = this.a;
    data['t'] = this.t;
    data['n'] = this.n;
    data['u'] = this.u;
    return data;
  }
}