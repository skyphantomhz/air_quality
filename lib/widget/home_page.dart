import 'package:air_quality/bloc/search_city_bloc.dart';
import 'package:air_quality/model/search_location/cities.dart';
import 'package:air_quality/model/search_location/city.dart';
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
    bloc.searchCities("da nang");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.red),
          child: StreamBuilder(
            stream: bloc.cities,
            builder: (BuildContext context, AsyncSnapshot<Cities> snapshot) {
              final data = snapshot?.data?.results;
              if (data == null) {
                emptyLayout();
              } else {
                contentLayout(data);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget emptyLayout() {
    return Center(
      child: Container(
        child: Text("Nothing available"),
      ),
    );
  }

  Widget contentLayout(List<City> data) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: Colors.greenAccent),
      child: Column(
        children: <Widget>[
          ListView.builder(
            itemCount: data?.length ?? 0,
            itemBuilder: (context, index) {
              final item = data[index];
              return Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    child: Text(
                      item?.s?.a?.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(item?.n?.first)
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
