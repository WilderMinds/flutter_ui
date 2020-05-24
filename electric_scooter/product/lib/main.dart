import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:product/common/custom_colors.dart';
import 'package:product/controller/router.dart';
import 'package:product/views/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Router _router = Router();

  void setStatusBar() async {
    
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // statusBarColor: Colors.grey, //or set color with: Color(0xFF0000FF)
      statusBarBrightness: Brightness.light
    ));

  if (Platform.isAndroid) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.grey);
  } else {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
  }
    

    return MaterialApp(
      title: 'Product',
      initialRoute: Router.homeRoute,
      onGenerateRoute: _router.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorDark: Colors.white,
        fontFamily: 'Montserrat',
      ),
    );
  }
}
