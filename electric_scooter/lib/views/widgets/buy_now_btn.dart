import 'package:flutter/material.dart';
import 'package:product/common/custom_colors.dart';
import 'package:product/common/size_config.dart';

class BuyNowButton extends StatelessWidget {
  final BuyBtnType btnType;
  const BuyNowButton({@required this.btnType});

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(
        SizeConfig.scaledWidth(10),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.scaledHeight(12),
          horizontal: SizeConfig.scaledWidth(27),
        ),
        decoration: BoxDecoration(
          color: btnType == BuyBtnType.PRIMARY
              ? CustomColors.primaryColor
              : Colors.white,
        ),
        child: Text(
          'BUY NOW',
          style: TextStyle(
            color: btnType == BuyBtnType.PRIMARY
                ? Colors.white
                : CustomColors.primaryColor,
            fontSize: SizeConfig.scaledFontSize(18),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

enum BuyBtnType {
  PRIMARY,
  SECONDARY,
}
