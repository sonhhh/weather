import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/api/data/api_latitude.dart';
import 'package:weather/api/data/welcome.dart';

class HomeProvider with ChangeNotifier {
  (double? lat, double? lon, String? city)? result;
  final RestClient1 _restClient1;
  double? fetchedLatitude;
  double? fetchedLongitude;
  Welcome? welcome;
  CurrentWeather? currentWeatherUi;
  List<double>? temperature2M;
  HomeProvider(Dio dio, this._restClient1); // : _restClient1 = RestClient1(dio)

  Future<void> update((double? lat, double? lon, String? city) data) async {
    result = data;
    notifyListeners();
  }
  Future<void> fetchWeatherData(
      double latitude, double longitude, CurrentWeather currentWeather) async {
    try {
      final response = await _restClient1.latitude(latitude, longitude, true);
        fetchedLatitude = response.latitude;
        fetchedLongitude = response.longitude;
        currentWeatherUi = response.currentWeather;
        print(currentWeatherUi?.temperature);
        welcome = response;
        notifyListeners();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
  Future<void> hourly(double latitude, double longitude, Hourly hourly )async {
    final data = await _restClient1.hourly(latitude, longitude, hourly);
    temperature2M = data.hourly?.temperature2M;
  }
}
