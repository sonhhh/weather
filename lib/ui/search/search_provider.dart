import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather/api/data/api_latitude.dart';
import 'package:weather/api/data/welcome.dart';
import '../../api/api_search.dart';
import '../../api/data/results.dart';

class SearchProvider with ChangeNotifier {
  final RestClient _restClient;
  final RestClient1 _restClient1;
  double? _fetchedLatitude;
  double? _fetchedLongitude;

  double? get fetchedLatitude => _fetchedLatitude;
  double? get fetchedLongitude => _fetchedLongitude;
  SearchProvider(Dio dio, this._restClient1) : _restClient = RestClient(dio);
  String? cityName;
  List<Result> result = [];
  double? latitude;
  double? longitude;
  Welcome? welcome;
  Future<void> search(String cityName) async {
    if (cityName == null) {
      throw Exception('City name is null');
    }
    try {
      final response = await _restClient.getSearch(cityName);
      if (response != null) {
        result = response.results;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
  Future<void> fetchWeatherData(double latitude, double longitude)async {
        if(latitude == null && longitude == null){
            throw Exception('city null');
        }
        try{
          final response = await _restClient1.latitude(latitude, longitude);
          if(response != null){
            _fetchedLatitude = latitude; // Store latitude
            _fetchedLongitude = longitude; // Store longitude
            notifyListeners();
          }
         // welcome =response;
        }catch (e){
          print(e);
        }
  }
}