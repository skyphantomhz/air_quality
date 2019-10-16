import 'package:air_quality/model/search_location/cities.dart';

abstract class BaseModel {
  Map<String, dynamic> toJson();
}

dynamic fromJson(Map<String, dynamic> data, Type T){
  if (T is Cities){
    return Cities.fromJson(data);
  }else return null;
}
