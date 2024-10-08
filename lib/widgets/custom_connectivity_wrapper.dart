// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:free_blood_donation/services/connectivity_service.dart';
// import 'package:get/get.dart';
//
// class ConnectivityWrapper extends StatefulWidget {
//   final Widget child;
//   final ConnectivityService connectivityService;
//
//   const ConnectivityWrapper({
//     super.key,
//     required this.child,
//     required this.connectivityService,
//   });
//
//   @override
//   _ConnectivityWrapperState createState() => _ConnectivityWrapperState();
// }
//
// class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
//   @override
//   void initState() {
//     super.initState();
//     // Listen for connectivity changes
//     widget.connectivityService.connectivityStream.listen((status) {
//       _handleConnectivityChange(status);
//     });
//   }
//
//   // Handle connectivity changes
//   void _handleConnectivityChange(ConnectivityResult result) {
//     if (result == ConnectivityResult.none) {
//       _showNoInternetDialog();
//     } else {
//       if (Get.isDialogOpen == true) {
//         Get.back(); // Close the dialog if internet is restored
//       }
//     }
//   }
//
//   // Show alert dialog when no internet connection is available
//   void _showNoInternetDialog() {
//     Get.dialog(
//       AlertDialog(
//         title: const Text('No Internet Connection'),
//         content: const Text(
//             'It seems you are not connected to the internet. Please check your connection.'),
//         actions: [
//           TextButton(
//             onPressed: () async {
//               final isConnected = await widget.connectivityService.isConnected();
//               if (isConnected) {
//                 Get.back(); // Close the dialog if the internet is restored
//               } else {
//                 // Optionally, show a message that the internet is still not available
//                 Get.snackbar(
//                   'Still No Connection',
//                   'Please check your internet settings.',
//                   snackPosition: SnackPosition.BOTTOM,
//                   backgroundColor: Colors.red,
//                   colorText: Colors.white,
//                 );
//               }
//             },
//             child: const Text('Refresh'),
//           ),
//         ],
//       ),
//       barrierDismissible: false, // Prevent dialog from closing by tapping outside
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return widget.child;
//   }
// }
