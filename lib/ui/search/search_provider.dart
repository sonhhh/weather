import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
<<<<<<< HEAD
import 'package:weather/api/data/welcome.dart';
=======
>>>>>>> b2d54a02ed47de4ac475c1876e734f6a7462ea66
import '../../api/api_search.dart';
import '../../api/data/results.dart';

class SearchProvider with ChangeNotifier {
  final RestClient _restClient;

<<<<<<< HEAD
  SearchProvider(Dio dio,) : _restClient = RestClient(dio);
  String? cityName;
  List<Result> result = [];
  double? latitude;
  double? longitude;
  Welcome? welcome;
=======
  SearchProvider(Dio dio) : _restClient = RestClient(dio);
  String? cityName;
  List<Result> result = [];

>>>>>>> b2d54a02ed47de4ac475c1876e734f6a7462ea66
  Future<void> search(String cityName) async {
    if (cityName == null) {
      throw Exception('City name is null');
    }
    try {
      final response = await _restClient.getSearch(cityName);
<<<<<<< HEAD
      if (response != null) {
        result = response.results;
=======
      if (response != null && response.name != null) {
        final responseData = Result.fromJson({'name': response.name});
        result = [responseData];
>>>>>>> b2d54a02ed47de4ac475c1876e734f6a7462ea66
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
