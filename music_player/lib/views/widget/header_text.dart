import 'package:flutter/material.dart';
import 'package:music_player/common/custom_colors.dart';
import 'package:music_player/common/size_config.dart';

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: SizeConfig.scaledFontSize(24),
        color: CustomColors.textHeader,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
