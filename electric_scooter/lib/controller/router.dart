import 'package:flutter/material.dart';
import 'package:product/common/size_config.dart';
import 'package:product/views/pages/home.dart';
import 'package:product/views/pages/product_details.dart';

class Router {
  static const homeRoute = '/';
  static const detailsRoute = '/product_details';

  Route routes(RouteSettings settings) {
    var routeName = settings.name;
    print(routeName);

    Route startineRoute({settings}) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return OrientationBuilder(
                builder: (context, orientation) {
                  SizeConfig().init(context, constraints, orientation);
                  return Home();
                },
              );
            },
          );
        },
      );
    }

    switch (routeName) {
      case homeRoute:
        return startineRoute(
          settings: settings,
        );
        break;

      case detailsRoute:
        var data  = settings.arguments as List; 
        return MaterialPageRoute(
          builder: (_) => ProductDetails(
            cartCount: data[0],
            product: data[1],
          ),
          settings: settings,
        );
      default:
    }
  }
}
