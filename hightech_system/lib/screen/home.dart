import 'package:flutter/material.dart';
import 'package:hightech_system/responsive/desktop_body.dart';
import 'package:hightech_system/responsive/mobile_body.dart';
import 'package:hightech_system/responsive/responsive_layout.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(desktopScreen: DesktopBody(), mobileScreen: MobileBody()),
    );
  }
}