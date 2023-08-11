import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weather/api/data/results.dart';
part 'api_search.g.dart';

@RestApi(baseUrl: "https://geocoding-api.open-meteo.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET('/v1/search')
  Future<Result> getSearch(
  @Query('name') String cityName);
}
