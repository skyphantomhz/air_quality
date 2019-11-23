import 'dart:convert';
import 'package:air_quality/model/city.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:air_quality/model/base_response.dart';

class SearchService {
  final http.Client client = GetIt.I<http.Client>();
  final _decoder = GetIt.I<JsonDecoder>();
  final String API_KEY = "6b101236-4e3a-4611-a5e0-2eb837b62f38";
  final baseRequest = "http://api.airvisual.com/v2";

  Future<City> fetchData() async {
    final lat = 16;
    final lon = 108;
    final response = await client.get(
        "$baseRequest/nearest_city?lat=$lat&lon=$lon&key=$API_KEY");
    final url =
        "$baseRequest/nearest_city?lat=$lat&lon=$lon&key=$API_KEY";
    print("=================$url=====================");
    if (response.statusCode == 200) {
      final responseObject =
          BaseResponse<City>.fromJson(_decoder.convert(response.body));
      if (responseObject.status == "success") {
        print("=================Response=====================");
        print("$responseObject");
        return responseObject.data;
      } else
        throw Exception("Failed to load route");
    } else {
      throw Exception("Failed to load route");
    }
  }


  Future<City> fetchSpecifiedCityData(String city, String state, String country) async {
    final response = await client.get(
        "$baseRequest/city?city=$city&state=$state&country=$country&key=$API_KEY");
    if (response.statusCode == 200) {
      final responseObject =
          BaseResponse<City>.fromJson(_decoder.convert(response.body));
      if (responseObject.status == "success") {
        print("=================Response=====================");
        print("$responseObject");
        return responseObject.data;
      } else
        throw Exception("Failed to load route");
    } else {
      throw Exception("Failed to load route");
    }
  }
}
