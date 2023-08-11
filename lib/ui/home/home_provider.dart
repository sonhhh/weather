import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../api/api_search.dart';
import '../../api/data/results.dart';

class HomeProvider with ChangeNotifier{
  final RestClient _restClient;

  HomeProvider(Dio dio) : _restClient = RestClient(dio);
  String? cityName;
  List<Result> result = [];
  Future<void> getDetail(String cityName) async{
    try {
      final detail = await _restClient.getSearch(cityName);
      if (detail != null && detail.name != null) {
        final responseData = Result.fromJson({'name': detail.name});
        result = [responseData];
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}