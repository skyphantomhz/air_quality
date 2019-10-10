import 'package:air_quality/bloc/search_city_bloc.dart';
import 'package:air_quality/model/city.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: bloc.city,
              initialData: City(),
              builder: (BuildContext context, AsyncSnapshot<City> snapshot) {
                final history = snapshot.data.history;
                final current = snapshot.data.current;
                print(
                    "#############${snapshot.data.toJson()}#####################");
                return Column(
                  children: <Widget>[
                    Container(
                      color: Colors.green,
                      child: ListTile(
                        title: Text(current?.weather?.tp?.toString() ?? ""),
                        leading: Text(current?.weather?.ts ?? ""),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
