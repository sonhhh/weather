import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../api/api_search.dart';
import '../../api/data/results.dart';

class SearchProvider with ChangeNotifier {
  final RestClient _restClient;

  SearchProvider(Dio dio) : _restClient = RestClient(dio);
  String? cityName;
  List<Result> result = [];

  Future<void> search(String cityName) async {
    if (cityName == null) {
      throw Exception('City name is null');
    }
    try {
      final response = await _restClient.getSearch(cityName);
      if (response != null && response.name != null) {
        final responseData = Result.fromJson({'name': response.name});
        result = [responseData];
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
