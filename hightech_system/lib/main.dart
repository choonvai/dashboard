import 'package:flutter/material.dart';
import 'package:hightech_system/animation/animation.dart';
import 'package:hightech_system/gameScreen/game_screen.dart';
import 'package:hightech_system/screen/costume.dart';
import 'package:hightech_system/screen/dashboard.dart';
import 'package:hightech_system/screen/home.dart';
// Import the dashboard screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'High Tech Dashboard',
      theme: ThemeData.dark(), // Use dark theme for the entire app
      home: TheAnimation(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/dashboard',
      routes:{
        '/home':(context)=>Home(),
        '/animated':(context)=>TheAnimation(),
        '/dashboard':(context)=>Dashboard(),
        '/geo':(context)=>GeometricAnimation(),
        '/game_screen':(context)=>GameScreen(),
      }
    );
  }
}
