// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FirstScreen(),
//     );
//   }
// }
//
// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('First Screen')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SecondScreen()),
//             ).then((result) {
//               if (result != null) {
//                 String cityName = result as String;
//                 print('Received cityName: $cityName');
//               }
//             });
//           },
//           child: Text('Go to Second Screen'),
//         ),
//       ),
//     );
//   }
// }
//
// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Second Screen')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             String cityName = 'New York'; // Replace with actual data
//             Navigator.pop(context, cityName);
//           },
//           child: Text('Send City Name Back'),
//         ),
//       ),
//     );
//   }
// }