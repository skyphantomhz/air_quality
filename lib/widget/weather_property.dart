import 'package:air_quality/widget/homecomponents/linear_progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherProperty extends StatefulWidget {
  const WeatherProperty(
      {Key key,
      this.name,
      this.value,
      this.percent,
      this.primaryColor,
      this.unit,
      this.secondColor = const Color(0xFFFAFAFA)})
      : super(key: key);

  final String name;
  final double value;
  final double percent;
  final Color primaryColor;
  final Color secondColor;
  final String unit;

  @override
  _WeatherPropertyState createState() => _WeatherPropertyState();
}

class _WeatherPropertyState extends State<WeatherProperty> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.name,
            style: TextStyle(color: Colors.black26, fontSize: 10.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.value.toInt().toString(),
                style: TextStyle(color: Colors.black26, fontSize: 14.0),
              ),
              Text(
                widget.unit,
                style: TextStyle(color: Colors.black26, fontSize: 8.0),
              ),
            ],
          ),
          SizedBox(
            child: CustomPaint(
              painter: LinearProgressPaint(
                percent: widget.percent,
                secondColor: widget.secondColor,
                primaryColor: widget.primaryColor,
              ),
            ),
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
