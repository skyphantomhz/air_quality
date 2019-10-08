import 'package:air_quality/model/search_location/cities.dart';
import 'package:air_quality/service/search_service.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class SearchCityBloc extends BlocProvider{
  final service = GetIt.I<SearchService>();
  PublishSubject<Cities> _cities = PublishSubject<Cities>();
  Observable<Cities> get cities => _cities.stream;

  PublishSubject<String> _keyWord = PublishSubject<String>();

  SearchCityBloc(){
    _keyWord.stream
      .sampleTime(const Duration(seconds: 3))
      .listen((keyWord) {
        _searchCities(keyWord);
      });
  }

  void _searchCities(String keyWord) async{
    final response = await service.searchCity(keyWord);
    _cities.sink.add(response);
  }
}