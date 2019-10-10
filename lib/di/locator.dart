
import 'dart:convert';

import 'package:air_quality/service/search_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton<Client>(() => Client());
  getIt.registerLazySingleton<JsonDecoder>(() => JsonDecoder());
  getIt.registerLazySingleton<SearchService>(() => SearchService());
  getIt.registerFactory(() => JsonDecoder());
}