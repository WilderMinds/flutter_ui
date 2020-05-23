import 'package:flutter/material.dart';
import 'package:product/common/custom_colors.dart';
import 'package:product/common/size_config.dart';

class SpecificationBadge extends StatelessWidget {
  final String name;
  final String value;
  final BadgeType badgeType;

  const SpecificationBadge({
    @required this.name,
    @required this.value,
    @required this.badgeType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.scaledWidth(100),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          SizeConfig.scaledWidth(10),
        ),
        border: badgeType == BadgeType.OUTLINE
            ? Border.all(width: 1, color: Colors.grey)
            : Border(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            value,
            style: TextStyle(
              color: CustomColors.defaultTextColor,
              fontSize: SizeConfig.scaledFontSize(24),
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            name,
             style: TextStyle(
              color: CustomColors.greyTextColor,
              fontSize: SizeConfig.scaledFontSize(14),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

enum BadgeType {
  OUTLINE,
  FILLED,
}
