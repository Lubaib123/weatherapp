import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/controller/weather_controller.dart';

class SharedPrefernceController extends ChangeNotifier {
  String locationName = "";
  String currentTemperature = "";
  String condition = "";

  String clouds = '';
  String visiblity = "";
  String wind = '';
  String Humidity = "";
  String feelslike = "";
  String rain = "";
  List CurrentdataList = [];
  Future saveWeatherData(BuildContext context) async {
    final weatherProvider =
        Provider.of<WeatherDataController>(context, listen: false);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('location', weatherProvider.locationName);
    await prefs.setString('temp', weatherProvider.currenttemperature);
    await prefs.setString('condition', weatherProvider.currentCondition);

    await prefs.setString('clouds', weatherProvider.clouds);
    await prefs.setString('visiblity', weatherProvider.visiblity);
    await prefs.setString('wind', weatherProvider.wind);
    await prefs.setString('humidity', weatherProvider.Humidity);
    await prefs.setString('feelslike', weatherProvider.feelslike);
    await prefs.setString('rain', weatherProvider.rain);

    locationName = prefs.getString('location') ?? "loading";
    currentTemperature = prefs.getString('temp') ?? "loading";
    condition = prefs.getString('condition') ?? "loading";

     CurrentdataList = [
      clouds = prefs.getString('clouds') ?? "loading",
      visiblity = prefs.getString('visiblity') ?? "loading",
      wind = prefs.getString('wind') ?? "loading",
      Humidity = prefs.getString('humidity') ?? "loading",
      feelslike = prefs.getString('feelslike') ?? "loading",
      rain = prefs.getString('rain') ?? "loading",
    ];

    clouds = prefs.getString('clouds') ?? "loading";
    visiblity = prefs.getString('visiblity') ?? "loading";
    wind = prefs.getString('wind') ?? "loading";
    Humidity = prefs.getString('humidity') ?? "loading";
    feelslike = prefs.getString('feelslike') ?? "loading";
    rain = prefs.getString('rain') ?? "loading";

    notifyListeners();

    return prefs.getString('location').toString();
  }

  // void getSavedWeatherData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   //locationName =  prefs.getString('location') ?? "hello";
  //   notifyListeners();
  // }
}
