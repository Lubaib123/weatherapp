import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utilities/theme.dart';

import '../../controller/shared_preference_controller.dart';
import '../../utilities/constants/constant.dart';

//Appbar

// AppBar AppBarWidget() {
//   return AppBar(
//     actions: [
//       Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.search,
//             size: 35,
//           ),
//         ),
//       )
//     ],
//     centerTitle: false,
//     elevation: 0,
//     // title: Row(
//     //   children: const [
//     //     Icon(Icons.location_pin),
//     //     Text("Kozhikode"),
//     //   ],
//     // ),
//     backgroundColor: Colors.transparent,
//   );
// }

// SizedBox weatherMainData(BuildContext context) {
//   return SizedBox(
//     height: 200,
//     width: 200,
//     child: Column(
//       children: [
//         Text(
//           "86°",
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//         Text(
//           "Partly Cloud",
//           style: Theme.of(context).textTheme.bodyMedium,
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         Text(
//           "H:90°  L:71°",
//           style: Theme.of(context).textTheme.bodyMedium,
//         ),
//         // midtitle(context, "edapt")
//       ],
//     ),
//   );
// }

// SizedBox cloudicons() {
//   return SizedBox(
//     height: 160,
//     width: 160,
//     child: Image.asset(
//       'assets/images/SunCloud.png',
//     ),
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
                      const SizedBox(width: 20),
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






Container searchresultcard(SharedPrefernceController sfProvider, BuildContext context) {
    return Container(
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
                                                        sfProvider
                                                                .Searchdatalist[
                                                            myindex][0],
                                                        //datacarddata[myindex][0],
                                                        size: 100,
                                                      ),
                                                      // Icon(headicon),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        sfProvider
                                                                .Searchdatalist[
                                                            myindex][1],
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
                                                              .Searchdatalist[
                                                          myindex][2],
                                                      style: TextStyle(
                                                          fontSize: 100)),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                      sfProvider
                                                              .Searchdatalist[
                                                          myindex][3],
                                                      style: TextStyle(
                                                          fontSize: 60)),
                                                ],
                                              ),
                                            ),
                                          );
  }