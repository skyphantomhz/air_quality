import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherProperty extends StatelessWidget {
  const WeatherProperty({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("CO2", 
          style: TextStyle(
            color: Colors.black26,
            fontSize: 12.0
          ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("340",
              style: TextStyle(
                color: Colors.black26,
                fontSize: 20.0
              ), ),
              Text("mg/l2",
              style: TextStyle(
                color: Colors.black26,
                fontSize: 10.0
              ), ),
            ],
          ),
          LinearProgressIndicator(
            value: 0.4,
            backgroundColor: Colors.black12,
          )
        ],
      ),
    );
  }
}