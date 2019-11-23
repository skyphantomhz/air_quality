import 'package:air_quality/bloc/search_city_bloc.dart';
import 'package:air_quality/model/city.dart';
import 'package:air_quality/widget/homecomponents/progress_arc.dart';
import 'package:air_quality/widget/weather_property.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SearchCityBloc bloc;
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<SearchCityBloc>(context);
    bloc.fetchData();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                StreamBuilder<City>(
                    stream: bloc.city,
                    builder: (context, snapshot) {
                      return Text(
                        snapshot?.data?.city ?? "N/A",
                        style: TextStyle(fontSize: 20),
                      );
                    }),
                StreamBuilder<City>(
                    stream: bloc.city,
                    builder: (context, snapshot) {
                      return Text(
                        snapshot?.data?.country ?? "N/A",
                        style: TextStyle(fontSize: 15, color: Colors.black26),
                      );
                    })
              ],
            ),
          ),
          Container(
            height: 200.0,
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.topCenter,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: StreamBuilder<City>(
                      stream: bloc.city,
                      builder: (context, snapshot) {
                        var aqi = snapshot.data?.current?.pollution?.aqius ?? 0;
                        double percent = aqi == 0 ? 0 : aqi / 500;
                        var color = aqiusColor(
                            snapshot.data?.current?.pollution?.aqius);
                        percent = percent > 1 ? 1 : percent;
                        return Container(
                          width: 200.0,
                          height: 200.0,
                          child: ProgressArc(
                            percent: percent,
                            primaryColor: color,
                            secondColor: Colors.grey[200],
                          ),
                        );
                      }),
                ),
                Align(
                  alignment: Alignment.center,
                  child: StreamBuilder<City>(
                      stream: bloc.city,
                      builder: (context, snapshot) {
                        return Text(
                            snapshot?.data?.current?.pollution?.aqius
                                    ?.toString() ??
                                "",
                            style: TextStyle(
                                fontFamily: 'AllRoundGothic', fontSize: 70));
                      }),
                ),
                Align(
                  alignment: Alignment(0, 0.5),
                  child: Text("AQI (US)"),
                ),
                Align(
                  alignment: Alignment(0, 1),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4)),
                    child: InkWell(
                      onTap: () {
                        print("Hello");
                      },
                      child: Text(
                        "Moderate",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(8),
                  child: StreamBuilder<City>(
                      stream: bloc.city,
                      builder: (context, snapshot) {
                        var aqi =
                            snapshot.data?.current?.pollution?.p2?.aqius ?? 0;
                        double percent = aqi == 0 ? 0 : aqi / 500;
                        var color = aqiusColor(
                            snapshot.data?.current?.pollution?.p2?.aqius);
                        percent = percent > 1 ? 1 : percent;
                        return WeatherProperty(
                          name: "pm2.5",
                          value: aqi.toDouble(),
                          percent: percent,
                          primaryColor: color,
                          secondColor: Colors.grey[200],
                          unit: "ugm3",
                        );
                      }),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(8),
                  child: StreamBuilder<City>(
                    stream: bloc.city,
                    builder: (context, snapshot) {
                      var aqi =
                            snapshot.data?.current?.pollution?.p1?.aqius ?? 0;
                        double percent = aqi == 0 ? 0 : aqi / 500;
                        var color = aqiusColor(
                            snapshot.data?.current?.pollution?.p1?.aqius);
                        percent = percent > 1 ? 1 : percent;
                      return WeatherProperty(
                        name: "pm10",
                        value: aqi.toDouble(),
                        percent: percent,
                        primaryColor: color,
                        secondColor: Colors.grey[200],
                        unit: "ugm3",
                      );
                    }
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(8),
                  child: StreamBuilder<City>(
                      stream: bloc.city,
                      builder: (context, snapshot) {
                        var aqi =
                            snapshot.data?.current?.pollution?.o3?.aqius ?? 0;
                        double percent = aqi == 0 ? 0 : aqi / 500;
                        var color = aqiusColor(
                            snapshot.data?.current?.pollution?.o3?.aqius);
                        percent = percent > 1 ? 1 : percent;
                        return WeatherProperty(
                          name: "Ozone O3",
                          value: aqi.toDouble(),
                          percent: percent,
                          primaryColor: color,
                          secondColor: Colors.grey[200],
                          unit: "ppb",
                        );
                      }),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(8),
                  child: StreamBuilder<City>(
                    stream: bloc.city,
                    builder: (context, snapshot) {
                      var aqi =
                            snapshot.data?.current?.pollution?.n2?.aqius ?? 0;
                        double percent = aqi == 0 ? 0 : aqi / 500;
                        var color = aqiusColor(
                            snapshot.data?.current?.pollution?.n2?.aqius);
                        percent = percent > 1 ? 1 : percent;
                      return WeatherProperty(
                        name: "n2",
                        value: aqi.toDouble(),
                        percent: percent,
                        primaryColor: color,
                        secondColor: Colors.grey[200],
                        unit: "ppb",
                      );
                    }
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(8),
                  child: StreamBuilder<City>(
                      stream: bloc.city,
                      builder: (context, snapshot) {
                        var aqi =
                            snapshot.data?.current?.pollution?.s2?.aqius ?? 0;
                        double percent = aqi == 0 ? 0 : aqi / 500;
                        var color = aqiusColor(
                            snapshot.data?.current?.pollution?.s2?.aqius);
                        percent = percent > 1 ? 1 : percent;
                        return WeatherProperty(
                          name: "s2",
                          value: aqi.toDouble(),
                          percent: percent,
                          primaryColor: color,
                          secondColor: Colors.grey[200],
                          unit: "ppb",
                        );
                      }),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(8),
                  child: StreamBuilder<City>(
                    stream: bloc.city,
                    builder: (context, snapshot) {
                      var aqi =
                            snapshot.data?.current?.pollution?.co?.aqius ?? 0;
                        double percent = aqi == 0 ? 0 : aqi / 500;
                        var color = aqiusColor(
                            snapshot.data?.current?.pollution?.co?.aqius);
                        percent = percent > 1 ? 1 : percent;
                      return WeatherProperty(
                        name: "co",
                        value: aqi.toDouble(),
                        percent: percent,
                        primaryColor: color,
                        secondColor: Colors.grey[200],
                        unit: "ppm",
                      );
                    }
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

slideBarProperty() {}

class SlideBarProperty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Color aqiusColor(int aqius) {
  if (aqius == null) {
    return Colors.grey;
  } else if (aqius < 51) {
    return Colors.green[400];
  } else if (aqius < 101) {
    return Colors.yellow;
  } else if (aqius < 151) {
    return Colors.orange[900];
  } else if (aqius < 201) {
    return Colors.red[900];
  } else if (aqius < 301) {
    return Colors.purple[900];
  } else {
    return Colors.brown[900];
  }
}
