import 'package:flutter/material.dart';
import 'package:music_player/common/custom_colors.dart';
import 'package:music_player/views/pages/home.dart';
import 'package:music_player/views/pages/nav_drawer.dart';
import 'package:music_player/views/widget/customDrawer.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<CustomDrawerState> _customDrawerKey = GlobalKey();

    void _toggleNavDrawer(_) {
      _customDrawerKey.currentState.toggle();
    }

    Widget _navMenu = Container(color: CustomColors.navDrawerBg, child: NavDrawer(),);
    // return _navMenu;
    return CustomDrawer(
      navMenu: _navMenu,
      homeScreen: Home(
        key: UniqueKey(),
        onMenuPressed: _toggleNavDrawer,
      ),
      key: _customDrawerKey,
    );
  }
}
