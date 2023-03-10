import 'package:flutter/material.dart';
import 'package:video_call_ui/video_call_screen.dart';
import 'package:video_call_ui/zijemu_on_call_screen.dart';
import 'package:video_call_ui/zijemu_outgoing_call_screen.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OutgoingCallScreen(),
    ));

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
   
//         primarySwatch: Colors.blue,
//       ),
//       home: const VideoCallScreen(),
//     );
//   }
// }
