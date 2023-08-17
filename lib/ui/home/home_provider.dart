<<<<<<< HEAD


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/api/data/api_latitude.dart';


class HomeProvider with ChangeNotifier {

  (double? lat, double? lon, String? city)? result;
  final RestClient1 _restClient1;
  double? _fetchedLatitude;
  double? _fetchedLongitude;

  double? get fetchedLatitude => _fetchedLatitude;
  double? get fetchedLongitude => _fetchedLongitude;

  HomeProvider(Dio dio, this._restClient1);
   //   : _restClient1 = RestClient1(dio);

  Future<void> update( (double? lat, double? lon, String? city) data) async {
    result = data;
    notifyListeners();
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
=======
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
>>>>>>> b2d54a02ed47de4ac475c1876e734f6a7462ea66
      print(e);
    }
  }
}