import 'package:flutter/material.dart';
import 'package:movies_apis_app/View/Homepage.dart';
import 'package:movies_apis_app/View/desktop/DeskHome.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  const ResponsiveLayout({super.key, required this.mobile, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (BuildContext context,constraints){
        if(constraints.maxWidth<400){
        return MyHomePage();
        }else{
        return DesktHome();
        }
      }),
    );
  }
}