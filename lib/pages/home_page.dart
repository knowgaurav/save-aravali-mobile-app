// import 'package:first_app/pages/about_page.dart';
// import 'package:first_app/pages/connectivity_provider.dart';
// import 'package:first_app/pages/contribute_page.dart';
// import 'package:first_app/pages/event_page.dart';
// import 'package:first_app/pages/no_internet.dart';
// import 'package:first_app/pages/social_feed.dart';
// import 'package:flutter/material.dart';

// final navigationKey = GlobalKey<NavigatorState>();

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final screens = [
//     AboutPage(),
//     SocialFeed(),
//     EventPage(),
//     ContributePage(),
//   ];

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
//   // }

//   var currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: screens[currentIndex],
//       bottomNavigationBar: Container(
//         key: navigationKey,
//         margin: EdgeInsets.all(15),
//         height: size.width * .155,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(.15),
//               blurRadius: 30,
//               offset: Offset(0, 10),
//             ),
//           ],
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: ListView.builder(
//           itemCount: 4,
//           scrollDirection: Axis.horizontal,
//           padding: EdgeInsets.symmetric(horizontal: size.width * .024),
//           itemBuilder: (context, index) => InkWell(
//             onTap: () {
//               setState(
//                 () {
//                   currentIndex = index;
//                 },
//               );
//             },
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AnimatedContainer(
//                   duration: Duration(milliseconds: 1500),
//                   curve: Curves.fastLinearToSlowEaseIn,
//                   margin: EdgeInsets.only(
//                     bottom: index == currentIndex ? 0 : size.width * .029,
//                     right: size.width * .0422,
//                     left: size.width * .0422,
//                   ),
//                   width: size.width * .128,
//                   height: index == currentIndex ? size.width * .014 : 0,
//                   decoration: BoxDecoration(
//                     color: Colors.green,
//                     borderRadius: BorderRadius.vertical(
//                       bottom: Radius.circular(10),
//                     ),
//                   ),
//                 ),
//                 Icon(
//                   listOfIcons[index],
//                   size: size.width * .076,
//                   color: index == currentIndex ? Colors.green : Colors.black38,
//                 ),
//                 SizedBox(height: size.width * .03),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   // Widget build(BuildContext context) {
//   //   Size size = MediaQuery.of(context).size;

//   //   return MultiProvider(
//   //       providers: [
//   //         ChangeNotifierProvider(
//   //           create: (context) => ConnectivityProvider(),
//   //           child: Scaffold(
//   //             body: screens[currentIndex],
//   //             bottomNavigationBar: Container(
//   //               key: navigationKey,
//   //               margin: EdgeInsets.all(15),
//   //               height: size.width * .155,
//   //               decoration: BoxDecoration(
//   //                 color: Colors.white,
//   //                 boxShadow: [
//   //                   BoxShadow(
//   //                     color: Colors.black.withOpacity(.15),
//   //                     blurRadius: 30,
//   //                     offset: Offset(0, 10),
//   //                   ),
//   //                 ],
//   //                 borderRadius: BorderRadius.circular(50),
//   //               ),
//   //               child: ListView.builder(
//   //                 itemCount: 4,
//   //                 scrollDirection: Axis.horizontal,
//   //                 padding: EdgeInsets.symmetric(horizontal: size.width * .024),
//   //                 itemBuilder: (context, index) => InkWell(
//   //                   onTap: () {
//   //                     setState(
//   //                       () {
//   //                         currentIndex = index;
//   //                       },
//   //                     );
//   //                   },
//   //                   splashColor: Colors.transparent,
//   //                   highlightColor: Colors.transparent,
//   //                   child: Column(
//   //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                     children: [
//   //                       AnimatedContainer(
//   //                         duration: Duration(milliseconds: 1500),
//   //                         curve: Curves.fastLinearToSlowEaseIn,
//   //                         margin: EdgeInsets.only(
//   //                           bottom:
//   //                               index == currentIndex ? 0 : size.width * .029,
//   //                           right: size.width * .0422,
//   //                           left: size.width * .0422,
//   //                         ),
//   //                         width: size.width * .128,
//   //                         height: index == currentIndex ? size.width * .014 : 0,
//   //                         decoration: BoxDecoration(
//   //                           color: Colors.green,
//   //                           borderRadius: BorderRadius.vertical(
//   //                             bottom: Radius.circular(10),
//   //                           ),
//   //                         ),
//   //                       ),
//   //                       Icon(
//   //                         listOfIcons[index],
//   //                         size: size.width * .076,
//   //                         color: index == currentIndex
//   //                             ? Colors.green
//   //                             : Colors.black38,
//   //                       ),
//   //                       SizedBox(height: size.width * .03),
//   //                     ],
//   //                   ),
//   //                 ),
//   //               ),
//   //             ),
//   //           ),
//   //         )
//   //       ],
//   // }

//   // Widget pageUI() {
//   //   return Consumer<ConnectivityProvider>(builder: (context, model, child) {
//   //     if (model.isOnline != null) {
//   //       return model.isOnline ? screens[currentIndex] : screens[currentIndex];
//   //     }

//   //     return Container(
//   //       child: Center(
//   //         child: CircularProgressIndicator(),
//   //       ),
//   //     );
//   //   });
//   // }

//   List<IconData> listOfIcons = [
//     Icons.home_rounded,
//     Icons.favorite_rounded,
//     Icons.event,
//     Icons.person_rounded,
//   ];
// }
