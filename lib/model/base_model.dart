
import 'package:air_quality/model/city.dart';

abstract class BaseModel {
  Map<String, dynamic> toJson();
}

dynamic fromJson(json, Type t) {
    print(json.toString());
    switch (t) {
      case City:
        return City.fromJson(json);
        break;
      default:
        throw Exception("Not handle this type.");
    }
  }
