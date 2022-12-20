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
                            //for testing geolocator
                            floatingActionButton:
                                FloatingActionButton(onPressed: () {
                              // GetCurrentLocation();
                            }),

                            backgroundColor: Colors.transparent,
                            appBar: AppBar(
                              bottom: PreferredSize(
                                preferredSize: Size.fromHeight(50),
                                // child: TextDropdownFormField(
                                //   options: ["", "Male", "Female"],
                                //   decoration: InputDecoration(
                                //     border: OutlineInputBorder(),
                                //     suffixIcon: Icon(Icons.arrow_drop_down),
                                //     labelText: "Gender",
                                //   ),
                                //   dropdownHeight: 120,
                                // ),
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
                                        // print(val);

                                        selected = true;
                                        // if(val =){

                                        // }
                                        //print(selected);

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
                                          ?

                                          // ignore: dead_code
                                          Container(
                                              height: 450,
                                              margin: const EdgeInsets.only(
                                                  left: 20.0,
                                                  right: 20.0,
                                                  bottom: 20),
                                              decoration: datacardtheme(),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          datacarddata[myindex]
                                                              [0],
                                                          size: 100,
                                                        ),
                                                        // Icon(headicon),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          datacarddata[myindex]
                                                              [1],
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleLarge,
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                        // sfProvider
                                                        //     .visiblity,
                                                        sfProvider
                                                                .CurrentdataList[
                                                            myindex],
                                                        style: TextStyle(
                                                            fontSize: 100)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                        datacarddata[myindex]
                                                            [1],
                                                        style: TextStyle(
                                                            fontSize: 60)),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : SizedBox(),

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

// Container mycontainer(SharedPrefernceController sfprovider) {
//   return Container(
//     height: 200,
//     width: double.infinity,
//     decoration: datacardtheme(),
//   child: Center(child :Text(sfprovider.CurrentdataList[1])),
//   );
// }

int searchandsort(String val, SharedPrefernceController sfProvider) {
  myindex = -1;

  if (val == "clouds") {
    print(" selected items : 0");
    myindex = 0;
    return myindex;
  } else if (val == "visiblity") {
    print(" selected items :1");
    myindex = 1;
    return myindex;
  } else if (val == "wind") {
    print(" selected items : 2");
    myindex = 2;
    return myindex;
  } else if (val == "Humidity") {
    print(" selected items : 3");
    myindex = 3;
    return myindex;
  } else if (val == "feelslike") {
    print(" selected items :4");
    myindex = 4;
    return myindex;
  } else if (val == "rain") {
    print(" selected items :5");
    myindex = 5;
    return myindex;
  } else {
    myindex = 6;
    return myindex;
  }
}



//  "clouds",
//                               "visiblity",
//                                         "wind",
//                                         "Humidity",
//                                         "feelslike",
//                                         "rain"