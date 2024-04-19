import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:movies_apis_app/View/Homepage.dart';
import 'package:movies_apis_app/responsivelayout.dart';
import 'package:movies_apis_app/View/DetailedScreen.dart';
import 'package:movies_apis_app/View/desktop/DeskHome.dart';
import 'package:movies_apis_app/Get/FavouriteController.dart';

void main() {
  Get.put(FavouriteController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FavouriteController _favouriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: 'Flutter Demo',
        theme: _favouriteController.isBright.value
            ? ThemeData.dark()
            : ThemeData.light(),
        home: ResponsiveLayout(
          mobile: MyHomePage(),
          desktop: DesktHome(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
