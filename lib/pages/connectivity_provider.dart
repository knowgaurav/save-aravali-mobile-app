// import 'dart:io';

// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/cupertino.dart';

// class ConnectivityProvider with ChangeNotifier {
//   Connectivity _connectivity = new Connectivity();

//   bool _isOnline = true;
//   bool get isOnline => _isOnline;

//   startMonitoring() async {
//     await initConnectivity();
//     _connectivity.onConnectivityChanged.listen((result) async {
//       if (result == ConnectivityResult.none) {
//         _isOnline = false;
//         notifyListeners();
//       } else {
//         await _updateConnectionStatus().then((bool isConnected) {
//           _isOnline = isConnected;
//           notifyListeners();
//         });
//       }
//     });
//   }

//   Future<void> initConnectivity() async {
//     try {
//       var status = await _connectivity.checkConnectivity();

//       if (status == ConnectivityResult.none) {
//         _isOnline = false;
//         notifyListeners();
//       } else {
//         _isOnline = true;
//         notifyListeners();
//       }
//     } on PlatformException catch (e) {
//       print('PlatformException: ' + e.toString());
//     }
//   }

//   Future<bool> _updateConnectionStatus() async {
//     bool isConnected = false;

//     try {
//       final List<InternetAddress> result =
//           await InternetAddress.lookup('google.com');
//       if (result.isEmpty && result[0].rawAddress.isNotEmpty) {
//         isConnected = true;
//       }
//     } on SocketException catch (_) {
//       isConnected = false;
//     }

//     return isConnected;
//   }
// }
