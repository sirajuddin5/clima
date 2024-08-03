import 'package:clima/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}



// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       themeMode: ThemeMode.dark,
//       color: Colors.black,
//       title: 'Animated Search Bar',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           title: Text('Animated Search Bar'),
//         ),
//         body: Center(
//           child: SearchBarDemo(
//             onSearchTextChanged: (String text) {
//               // Callback to handle search text changes
//               print('Search text changed: $text');
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }


