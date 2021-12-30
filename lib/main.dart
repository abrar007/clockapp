import 'package:clock_app/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Time Picker Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(colorScheme: ColorScheme.light()),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

//   void _selectTime() async {
//     final TimeOfDay? newTime = await showTimePicker(
//       context: context,
//       initialTime: _time,

//     );
//     if (newTime != null) {
//       setState(() {
//         _time = newTime;
//       });
//     }
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: _selectTime,
//               child: Text('SELECT TIME'),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Selected time: ${_time.format(context)}',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(GetMaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(245, 245, 247, 1),
        selectedRowColor: const Color.fromRGBO(245, 245, 247, 1),
        dividerTheme: const DividerThemeData(
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
      ),
      home: DashBoardScreen()));
}
