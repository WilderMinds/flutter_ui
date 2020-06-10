import 'package:flutter/material.dart';

import 'controller/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Router _router = Router();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Textfield Effects',
      initialRoute: Router.homeRoute,
      onGenerateRoute: _router.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'BalsamiqSans',
      ),
    );
  }
}
