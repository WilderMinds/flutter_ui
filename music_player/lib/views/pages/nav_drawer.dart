import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/common/custom_colors.dart';
import 'package:music_player/common/images.dart';
import 'package:music_player/common/size_config.dart';
import 'package:music_player/views/widget/menu_item.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //

    Widget avatar = Container(
      padding: EdgeInsets.all(
        4, // SizeConfig.scaledWidth(2)
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(.6),
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(Images.AVATAR),
        radius: SizeConfig.scaledWidth(18),
      ),
    );

    Widget drawerHeader = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        avatar,
        SizedBox(width: SizeConfig.scaledWidth(8)),
        Text(
          'Sam Kwame',
          style: TextStyle(
            color: Colors.white.withOpacity(.8),
            fontSize: SizeConfig.scaledFontSize(18),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );

    Widget menuItems = Column(
      children: <Widget>[
        MenuItem(icon: Images.LIBRARY, text: 'Library'),
        SizedBox(height: SizeConfig.scaledHeight(30)),
        MenuItem(icon: Images.EQUALIZER, text: 'Equalizer'),
        SizedBox(height: SizeConfig.scaledHeight(30)),
        MenuItem(icon: Images.PLAYLIST, text: 'Playlist'),
        SizedBox(height: SizeConfig.scaledHeight(30)),
        MenuItem(icon: Images.RECORD, text: 'Record'),
        SizedBox(height: SizeConfig.scaledHeight(30)),
        MenuItem(icon: Images.RADIO, text: 'Radio'),
        SizedBox(height: SizeConfig.scaledHeight(30)),
        MenuItem(icon: Images.SETTINGS, text: 'Settings'),
      ],
    );

    return Scaffold(
      backgroundColor: CustomColors.navDrawerBg,
      body: Center(
        child: Container(
          height: 0.7 * MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.scaledWidth(25)),
                child: drawerHeader,
              ),
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.scaledWidth(50)),
                child: menuItems,
              ),
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.scaledWidth(50)),
                child: MenuItem(icon: Images.EXIT, text: 'Log Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
