import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/common/size_config.dart';

class MenuItem extends StatelessWidget {
  final String icon;
  final String text;
  const MenuItem({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(
          icon,
          fit: BoxFit.contain,
          height: SizeConfig.scaledHeight(24),
          color: Colors.white.withOpacity(.8),
        ),
        SizedBox(width: SizeConfig.scaledWidth(15)),
        Text(
          text,
          style: TextStyle(
            color: Colors.white.withOpacity(.8),
            fontSize: SizeConfig.scaledFontSize(18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
