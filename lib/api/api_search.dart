import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
<<<<<<< HEAD
import 'package:weather/api/data/data_response.dart';

=======
import 'package:weather/api/data/results.dart';
>>>>>>> b2d54a02ed47de4ac475c1876e734f6a7462ea66
part 'api_search.g.dart';

@RestApi(baseUrl: "https://geocoding-api.open-meteo.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET('/v1/search')
<<<<<<< HEAD
  Future<DataResponse> getSearch(
  @Query('name') String name, );
=======
  Future<Result> getSearch(
  @Query('name') String cityName);
>>>>>>> b2d54a02ed47de4ac475c1876e734f6a7462ea66
}
