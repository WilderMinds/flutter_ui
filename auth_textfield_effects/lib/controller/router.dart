import 'package:auth_textfield_effects/controller/size_config.dart';
import 'package:auth_textfield_effects/views/pages/signin.dart';
import 'package:auth_textfield_effects/views/pages/signup.dart';
import 'package:flutter/material.dart';

class Router {
  static const homeRoute = '/';
  static const signupRoute = '/signup';

  Route startineRoute({settings}) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                SizeConfig().init(context, constraints, orientation);
                return Signin();
                // Home(
                //   key: UniqueKey(),
                // );
              },
            );
          },
        );
      },
    );
  }

  Route routes(RouteSettings settings) {
    var routeName = settings.name;
    print(routeName);

    switch (routeName) {
      case homeRoute:
        return startineRoute(
          settings: settings,
        );
        break;

      case signupRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Signup(),
        );
      default:
    }
  }
}
