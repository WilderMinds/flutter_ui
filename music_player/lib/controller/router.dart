import 'package:flutter/material.dart';
import 'package:music_player/common/size_config.dart';
import 'package:music_player/model/music.dart';
import 'package:music_player/views/pages/home.dart';
import 'package:music_player/views/pages/landing.dart';
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
                  return Landing();
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

    switch (routeName) {
      case homeRoute:
        return startineRoute(
          settings: settings,
        );
        break;

      case nowPlayingRoute:
        var data = settings.arguments as List;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return NowPlaying(
              music: data[0],
              isPlaying: data[1],
            );
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
