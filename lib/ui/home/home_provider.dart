import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/api/api_search.dart';
import 'package:weather/api/data/results.dart';

class HomeProvider with ChangeNotifier {
  final RestClient _restClient;
  List<Result> result = [];

  HomeProvider(Dio dio) : _restClient = RestClient(dio);

  Future<void> update(List<Result> data) async {
    result = data;
    notifyListeners();
  }
}