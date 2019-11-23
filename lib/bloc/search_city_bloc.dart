import 'dart:async';

import 'package:air_quality/model/city.dart';
import 'package:air_quality/service/search_service.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class SearchCityBloc extends Bloc {
  final service = GetIt.I<SearchService>();
  PublishSubject<City> _city = PublishSubject<City>();
  Observable<City> get city => _city.stream;

  void fetchData() async {
    final response = await service.fetchSpecifiedCityData("Los Angeles", "California", "USA");
    _city.sink.add(response);
  }

  @override
  void dispose() {
    _city.close();
  }
}
