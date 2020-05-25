import 'package:flutter/material.dart';
import 'package:music_player/controller/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Router _router = Router();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      initialRoute: Router.homeRoute,
      onGenerateRoute: _router.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
