import 'package:air_quality/model/search_location/cities.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class SearchService{
  final http.Client client = GetIt.I<http.Client>();
  final baseRequest = "https://api.waqi.info";
  Future<Cities> searchCity(String keyWord) async {
    final response = await client.post("${baseRequest}/nsearch/full/${keyWord}");
    if (response.statusCode == 200) {
      return Cities.fromJson(response.body);
    } else {
      throw Exception("Failed to load route");
    }
  }
}