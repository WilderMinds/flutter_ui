
import 'package:auth_textfield_effects/common/custom_colors.dart';
import 'package:auth_textfield_effects/common/images.dart';
import 'package:auth_textfield_effects/controller/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NextButton extends StatelessWidget {
  final dynamic onPressed;
  const NextButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(
          SizeConfig.scaledWidth(20),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CustomColors.btnColor,
        ),
        child: SvgPicture.asset(
          Images.FORWARD_ICON,
          color: Colors.white,
          fit: BoxFit.contain,
          height: SizeConfig.scaledHeight(28),
        ),
      ),
    );
  }
}
