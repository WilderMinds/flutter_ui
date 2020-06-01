import 'package:flutter/material.dart';
import 'package:product/common/custom_colors.dart';
import 'package:product/common/size_config.dart';

class SpecificationBadge extends StatelessWidget {
  final String name;
  final String value;
  final BadgeType badgeType;
  final double height;

  SpecificationBadge({
    @required this.name,
    @required this.value,
    @required this.badgeType,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: badgeType == BadgeType.OUTLINE
          ? SizeConfig.scaledWidth(85)
          : SizeConfig.scaledWidth(100),
      height: badgeType == BadgeType.OUTLINE ? height : null,
      decoration: BoxDecoration(
        color:
            badgeType == BadgeType.OUTLINE ? Colors.transparent : Colors.white,
        borderRadius: BorderRadius.circular(
          SizeConfig.scaledWidth(15),
        ),
        border: badgeType == BadgeType.OUTLINE
            ? Border.all(
                width: 1,
                color: Colors.black12,
              )
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
              fontSize: SizeConfig.scaledFontSize(12),
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
