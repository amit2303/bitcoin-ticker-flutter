import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: const Color.fromARGB(255, 10, 55, 76),
          scaffoldBackgroundColor: Colors.white),
      home: PriceScreen(),
    );
  }
}


// //https://rest.coinapi.io/v1/exchangerate/BTC/INR?apikey=7D92C932-CCE9-4431-9069-53BFAD47D403



// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp();

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// int count =0;
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Expanded(
//                   child: Card(
//                     child: Text("count is : $count"),
//                     color: Colors.amber,
//                   ),
//                 ),
//                 Expanded(
//                   child: Card(
//                     child: Text("count is : $count"),
//                     color: Colors.amber,
//                   ),
//                 ),
//                 Expanded(
//                   child: Card(
//                     child: Text("count is : $count"),
//                     color: Colors.amber,
//                   ),
//                 ),
//                 TextButton(onPressed: (){
//                     setState(() {
//                       count++;
//                       print(count);
//                     });
//                 }, child: Text("increase"))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
