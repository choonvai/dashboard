import 'package:flutter/material.dart';
class ResponsiveLayout extends StatelessWidget{
  ResponsiveLayout({required this.desktopScreen,required this.mobileScreen});
  final Widget mobileScreen;
  final Widget desktopScreen;
  @override
  Widget build(BuildContext context){
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth <600){
          return mobileScreen;
        }
        else{
          return desktopScreen;
        }
      },
    );
  }
}