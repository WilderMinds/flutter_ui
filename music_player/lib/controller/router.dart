import 'package:flutter/material.dart';
import 'package:music_player/common/size_config.dart';
import 'package:music_player/views/pages/home.dart';
import 'package:music_player/views/pages/now_playing.dart';

class Router {
  static const homeRoute = '/';
  static const nowPlayingRoute = '/now_playing';

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

      case nowPlayingRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return NowPlaying();
          },
        );
        break;

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return Container();
          },
        );
        break;
    }
  }
}
