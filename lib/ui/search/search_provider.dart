import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../api/api_search.dart';
import '../../api/data/results.dart';

class SearchProvider extends ChangeNotifier{
  final RestClient _restClient;
  SearchProvider(Dio dio) : _restClient = RestClient(dio);

  List<Result> result =[];
  Future<void> search() async {
  // final response = await _restClient.getSearch();

  }
}