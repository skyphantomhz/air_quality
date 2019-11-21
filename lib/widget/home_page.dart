import 'package:air_quality/bloc/search_city_bloc.dart';
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
                Text(
                  "Da Nang",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Vietnam",
                  style: TextStyle(fontSize: 15, color: Colors.black26),
                )
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
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    child: ProgressArc(),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text("29",
                      style: TextStyle(
                          fontFamily: 'AllRoundGothic', fontSize: 70)),
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
                  child: WeatherProperty(
                    name: "CO2",
                    value: 200,
                    percent: 0.3,
                    primaryColor: Colors.green,
                    secondColor: Colors.grey,
                    unit: "g/m3",
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(8),
                  child: WeatherProperty(
                    name: "O2",
                    value: 500,
                    percent: 0.95,
                    primaryColor: Colors.green,
                    secondColor: Colors.grey,
                    unit: "g/m3",
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
