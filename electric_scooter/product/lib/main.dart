import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:product/common/custom_colors.dart';
import 'package:product/controller/router.dart';
import 'package:product/views/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Router _router = Router();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey, //or set color with: Color(0xFF0000FF)
    ));

    return MaterialApp(
      title: 'Product',
      initialRoute: Router.homeRoute,
      onGenerateRoute: _router.routes,
      theme: ThemeData(
        primaryColorDark: Colors.white,
        fontFamily: 'Montserrat',
      ),
    );
  }
}
