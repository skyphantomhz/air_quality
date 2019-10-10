import 'package:air_quality/bloc/search_city_bloc.dart';
import 'package:air_quality/widget/home_page.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';

import 'di/locator.dart';

void main() {
  setupLocator();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<SearchCityBloc>(
        creator: (_context, _bag) => SearchCityBloc(),
        child: HomePage(title: 'Flutter Demo Home Page'),
        autoDispose: true,
      ),
    );
  }
}