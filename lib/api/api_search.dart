import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'data/results.dart';

part 'api_search.g.dart';

@RestApi(baseUrl: "https://geocoding-api.open-meteo.com/v1")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET('/v1/search')
    Future<Result?> getSearch(
  @Query('name') String cityName);
}

// class DataProvider extends ChangeNotifier{
//   late final RestClient restClinet;
//     DataProvider(this.restClinet);
//     String searchResult = '';
//    Future<void> search(String cityName)async {
//      try{
//        final response = await restClinet.getSearch(cityName);
//        if(response != null){
//          searchResult = response.name!;
//          notifyListeners();
//        }
//      }catch(e){
//        print(e);
//      }
//    }
// }