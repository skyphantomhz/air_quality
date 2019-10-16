import 'package:air_quality/bloc/search_city_bloc.dart';
import 'package:air_quality/di/locator.dart';
import 'package:air_quality/widget/home_page.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';


void main() {
  setupLocator();
  runApp(
    BlocProvider<SearchCityBloc>(
      creator: (_context, _bag) => SearchCityBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}