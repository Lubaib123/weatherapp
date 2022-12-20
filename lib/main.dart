import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/controller/current_location_controller.dart';
import 'package:weather_app/controller/shared_preference_controller.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/utilities/theme.dart';
import 'package:weather_app/view/splashScreen/splash_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  // await GetCurrentLocation();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CurrentLocationController>(
            create: (context) => CurrentLocationController()),
             ChangeNotifierProvider<WeatherDataController>(
            create: (context) => WeatherDataController()),
            ChangeNotifierProvider<SharedPrefernceController>(
            create: (context) => SharedPrefernceController())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: themeData(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.system,
          home: const SplashScreen()),
    );
  }
}
