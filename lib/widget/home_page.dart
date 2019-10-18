import 'dart:math';

import 'package:air_quality/bloc/search_city_bloc.dart';
import 'package:air_quality/model/city.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

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
      body: Container(
        alignment: Alignment.topCenter,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.only(top: 30),
                width: 200.0,
                height: 180.0,
                child: ProgressArc(),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text("29", style: TextStyle(fontFamily: 'AllRoundGothic')),
            ),
          ],
        ),
      ),
      // body:
      //  SingleChildScrollView(
      //   child: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisSize: MainAxisSize.max,
      //       children: <Widget>[
      //         Container(
      //           decoration: BoxDecoration(color: Colors.amberAccent),
      //           child: ProgressArc(),
      //           // Text(
      //           //   "23",
      //           //   style: TextStyle(fontSize: 30.0, fontFamily: 'AllRoundGothic'),
      //           // ),
      //         ),
      //       ]),
      // ),
    );
  }

  // Widget demo() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Column(
  //       children: <Widget>[
  //         StreamBuilder(
  //           stream: bloc.city,
  //           initialData: City(),
  //           builder: (BuildContext context, AsyncSnapshot<City> snapshot) {
  //             final history = snapshot.data.history;
  //             final current = snapshot.data.current;
  //             return Column(
  //               children: <Widget>[
  //                 Container(
  //                   color: Colors.green,
  //                   child: ProgressArc(),
  //                   // ListTile(
  //                   //   title: Text(current?.weather?.tp?.toString() ?? ""),
  //                   //   leading: Text(current?.weather?.ts ?? ""),
  //                   // ),
  //                 ),
  //               ],
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

class ProgressArc extends StatefulWidget {
  @override
  _ProgressArcState createState() => _ProgressArcState();
}

class _ProgressArcState extends State<ProgressArc> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: ProgressArcPaint(),
    );
  }
}

class ProgressArcPaint extends CustomPainter {
  final basePaint = Paint()
    ..color = Colors.black26
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..strokeCap = StrokeCap.round;

  final primaryPaint = Paint()
    ..color = Colors.green[200]
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..strokeCap = StrokeCap.round;

  final startAngle = -math.pi;
  final baseAngle = math.pi;
  final useCenter = false;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);

    final sweepAngle = math.pi * 2 / 3;

    canvas.drawArc(rect, startAngle, baseAngle, useCenter, basePaint);
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, primaryPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
