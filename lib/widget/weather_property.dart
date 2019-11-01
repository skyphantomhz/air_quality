import 'dart:math';

import 'package:air_quality/widget/homecomponents/linear_progress.dart';
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
          Text(
            "CO2",
            style: TextStyle(color: Colors.black26, fontSize: 12.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "340",
                style: TextStyle(color: Colors.black26, fontSize: 20.0),
              ),
              Text(
                "mg/l2",
                style: TextStyle(color: Colors.black26, fontSize: 10.0),
              ),
            ],
          ),
          CustomPaint(
            size: Size(100, 20),
            painter: LinearProgressPaint(
              percent: Random().nextDouble(),
              secondColor: Colors.grey[200],
              primaryColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
