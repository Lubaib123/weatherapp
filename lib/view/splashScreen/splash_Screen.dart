import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/current_location_controller.dart';
import 'package:weather_app/controller/weather_controller.dart';
import '../dashboardScreen/dashboard_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    

    //function called using provider to fetch user curretn location
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final currentLocationProvider =
          Provider.of<CurrentLocationController>(context, listen: false);
      currentLocationProvider.getCurrentoLocation();
      final weatherProvider =
          Provider.of<WeatherDataController>(context, listen: false);
      weatherProvider.fetchWeatherData(
          currentLocationProvider.latitude.toString(),
          currentLocationProvider.longitude.toString(),
          );
      // final sfProvider =
      //     Provider.of<SharedPrefernceController>(context, listen: false);
      // sfProvider.saveWeatherData(context);
    });

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        final currentLocationProvider =
            Provider.of<CurrentLocationController>(context, listen: false);

        return currentLocationProvider.isPermissionGiven
            ? const DashboardScreen()
            : const SplashScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text(
          "Lilac Flutter \n Assignment",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
