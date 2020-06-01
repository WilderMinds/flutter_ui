import 'package:flutter/material.dart';
import 'package:product/common/custom_colors.dart';
import 'package:product/common/size_config.dart';

class TextHeader extends StatelessWidget {
  final String text;
  Color color;
  TextHeader({@required this.text, this.color});

  @override
  Widget build(BuildContext context) {

    if (color == null) {
      color = CustomColors.defaultTextColor;
    }

    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: SizeConfig.scaledFontSize(22),
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
