import 'package:flutter/material.dart';

//Appbar

AppBar AppBarWidget() {
  return AppBar(
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
  );
}

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
