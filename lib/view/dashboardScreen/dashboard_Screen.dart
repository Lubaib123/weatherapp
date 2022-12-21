import 'dart:async';

import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/current_location_controller.dart';
import 'package:weather_app/controller/shared_preference_controller.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/utilities/constants/constant.dart';
import 'package:weather_app/utilities/theme.dart';
import 'package:weather_app/view/dashboardScreen/dashboard_Widget.dart';
import 'package:dropdown_search/dropdown_search.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //var selectedItems = "";
    bool selected = false;
    //selectedItems == "";
    return Consumer<CurrentLocationController>(
        builder: (context, currentLocationProvider, _) {
      return Consumer<WeatherDataController>(
          builder: (context, weatherDataProvider, _) {
        return FutureBuilder(
            future: weatherDataProvider.fetchWeatherData(
              currentLocationProvider.latitude!,
              currentLocationProvider.longitude!,
            ),
            builder: (context, weatherData) {
              return weatherData.hasData
                  ? Consumer<SharedPrefernceController>(
                      builder: (context, sfProvider, child) {
                      sfProvider.saveWeatherData(
                        context,
                      );

                      return Container(
                          decoration: scafoldTheme(),
                          child: Scaffold(
                            backgroundColor: Colors.transparent,
                            // appBar: customAppbar(selected, sfProvider),
                            appBar: AppBar(
                              bottom: PreferredSize(
                                preferredSize: Size.fromHeight(50),
                                child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: DropdownSearch<String>(
                                      popupProps: PopupProps.menu(
                                        showSelectedItems: true,
                                        disabledItemFn: (String s) =>
                                            s.startsWith('I'),
                                      ),
                                      items: const [
                                        "clouds",
                                        "visiblity",
                                        "wind",
                                        "Humidity",
                                        "feelslike",
                                        "rain"
                                      ],
                                      onChanged: (val) {
                                        // print(val);

                                        selected = true;
                                       

                                        searchandsort(val!, sfProvider);
                                      },
                                      selectedItem: selectedItems,
                                    )),
                              ),
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.search,
                                      size: 35,
                                    ),
                                  ),
                                )
                              ],
                              centerTitle: false,
                              elevation: 0,
                            
                              backgroundColor: Colors.transparent,
                            ),
                            body: SingleChildScrollView(
                              child: SafeArea(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //const SizedBox(height: 15),

                                      //cloudsIcon

                                      SizedBox(
                                        height: 160,
                                        width: 160,
                                        child: Image.asset(
                                          'assets/images/SunCloud.png',
                                        ),
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.location_pin),
                                          Text(sfProvider.locationName,
                                              style: TextStyle(fontSize: 30)),
                                        ],
                                      ),

                                      // MainData
                                      SizedBox(
                                        height: 170,
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            Text(
                                                "${sfProvider.currentTemperature}°C",
                                                style: TextStyle(fontSize: 60)),
                                            Text(sfProvider.condition,
                                                style: TextStyle(fontSize: 40)),
                                          ],
                                        ),
                                      ),
                                      selected
                                          ?

                                          // ignore: dead_code
                                          searchresultcard(sfProvider, context)
                                          : SizedBox(),

                                      //data in grid
                                      GridData(sfProvider),

                                      
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ));
                    })
                  : const Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
            });
      });
    });
  }

 
}


