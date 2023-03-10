import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/utilities/theme.dart';

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
  List Searchdatalist = [];
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

    Searchdatalist = [
      [
        Icons.cloud,
        "Clouds",
        clouds = prefs.getString('clouds') ?? "loading",
        '%',
      ],
      [
        Icons.visibility_rounded,
        "Visiblity",
        visiblity = prefs.getString('visiblity') ?? "loading",
        'km',
      ],
      [
        Icons.wind_power,
        "wind",
        wind = prefs.getString('wind') ?? "loading",
        'km',
      ],
      [
        Icons.heat_pump,
        "Humidity",
        Humidity = prefs.getString('humidity') ?? "loading",
        '%',
      ],
      [
        Icons.medical_information,
        "feels like",
        feelslike = prefs.getString('feelslike') ?? "loading",
        '0',
      ],
      [
        Icons.water_drop_outlined,
        "rain",
        rain = prefs.getString('rain') ?? "loading",
        '%',
      ]
    ];

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

    Container searchdata() {
      return Container(
        width: double.infinity,
        height: 400,
        decoration: datacardtheme(),
      );
    }

    notifyListeners();

    return prefs.getString('location').toString();
  }

  // void getSavedWeatherData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   //locationName =  prefs.getString('location') ?? "hello";
  //   notifyListeners();
  // }
}
