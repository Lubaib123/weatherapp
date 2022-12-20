import 'dart:async';

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
    var selectedItems = "h";
    bool selected = selectedItems == "";
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
                            //for testing geolocator
                            floatingActionButton:
                                FloatingActionButton(onPressed: () {
                              // GetCurrentLocation();
                            }),

                            backgroundColor: Colors.transparent,
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
                                        "",
                                        "clouds",
                                        "visiblity",
                                        "wind",
                                        "Humidity",
                                        "feelslike",
                                        "rain"
                                      ],
                                      onChanged: (val) {
                                        print(val);
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
                              // title: Row(
                              //   children: const [
                              //     Icon(Icons.location_pin),
                              //     Text("Kozhikode"),
                              //   ],
                              // ),
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
                                          Text(sfProvider.locationName),
                                        ],
                                      ),

                                      // MainData
                                      SizedBox(
                                        height: 170,
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            Text(
                                              sfProvider.currentTemperature,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Text(
                                              sfProvider.condition,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                          ],
                                        ),
                                      ),
                                      selected
                                          ? SizedBox()
                                          :
                                          // ignore: dead_code
                                          Container(
                                              height: 450,
                                              margin: const EdgeInsets.only(
                                                  left: 20.0,
                                                  right: 20.0,
                                                  bottom: 20),
                                              decoration: datacardtheme(),
                                            ),

                                      //data in grid
                                      GridData(sfProvider),

                                      // gridCard(context, Icons.sunny_snowing, "Snow", '%', 50)
                                      // gridCard(context, "Humidity", "%", 80),
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

Container GridData(SharedPrefernceController sfProvider) {
  return Container(
    margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
    width: double.infinity,
    child: GridView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2 / 2,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (BuildContext context, int index) {
          return //gridCard(context, index);
              Container(
            margin: const EdgeInsets.all(10),
            //  margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10),
            height: 160,
            width: 160,
            decoration: datacardtheme(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(datacarddata[index][0]),
                      // Icon(headicon),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        datacarddata[index][1],
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        // sfProvider
                        //     .visiblity,
                        sfProvider.CurrentdataList[index],
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        datacarddata[index][2],
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //  color: Colors.white,
          );
        }),
  );
}
