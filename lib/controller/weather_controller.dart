import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/weather_model.dart';

class WeatherDataController extends ChangeNotifier {
  String locationName = "";
  String currenttemperature = "";
  String currentCondition = "";

  String clouds = '';
  String visiblity = "";
  String wind = '';
  String Humidity = "";
  String feelslike = "";
  String rain = "";
  //function to fetch weather data from api
  Future<WeatherModel> fetchWeatherData(
      String latitudeNumber, String longitudeNumber) async {
    final response = await http.get(Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=c0dbb6f1794640eeabf103014222805&q=$latitudeNumber,$longitudeNumber&aqi=no"));
    final weatherModel = weatherModelFromJson(response.body);
    // final sfProvider =
    //     Provider.of<sharedPrefernceController>(context, listen: false);
    if (response.statusCode == 200) {
      locationName = weatherModel.location.name;
      currenttemperature = weatherModel.current.tempC.toString();
      currentCondition = weatherModel.current.condition.text;
      clouds = weatherModel.current.cloud.toString();
      visiblity = weatherModel.current.visKm.toString();
      wind = weatherModel.current.windKph.toString();
      Humidity = weatherModel.current.humidity.toString();
      feelslike = weatherModel.current.feelslikeC.toString();
      rain = weatherModel.current.precipIn.toString();

      notifyListeners();

      // sharedPrefernceController().saveWeatherData(context);
      // notifyListeners();

      return weatherModel;
    } else {
      throw Exception('Failed to load Weather data');
    }
  }
}
