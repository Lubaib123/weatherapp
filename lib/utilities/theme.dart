import 'package:flutter/material.dart';

BoxDecoration scaffoldColor() {
  return const BoxDecoration(
      gradient: LinearGradient(
    colors: [
      Color(0xFF00CCFF),
      Color(0xFF3366FF),
    ],
    begin: FractionalOffset(0.0, 1.0),
    end: FractionalOffset(1.0, 0.0),
    stops: [0.0, 1.0],
  ));
}

TextTheme AppTextTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
        fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.white),
    titleMedium: TextStyle(fontSize: 60.0, color: Colors.white),
    bodyMedium:
        TextStyle(fontSize: 25.0, fontFamily: 'Hind', color: Colors.white),
    bodyLarge:
        TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
  );
}

BoxDecoration scafoldTheme() {
  return const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
          image: AssetImage('assets/images/DashBoardScreenBackground.jpg')));
}

ThemeData themeData() {
  return ThemeData(
    primaryColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: AppTextTheme(),
  );
}

BoxDecoration datacardtheme() {
  return new BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.blue.shade200.withOpacity(0.5));
}
