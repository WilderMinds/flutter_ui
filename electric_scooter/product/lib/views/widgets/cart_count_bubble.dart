import 'package:flutter/material.dart';
import 'package:product/common/custom_colors.dart';
import 'package:product/common/size_config.dart';

class CartCountBubble extends StatelessWidget {
  final int count;
  const CartCountBubble({@required this.count}) : assert(count != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: SizeConfig.scaledWidth(2),
      // height: SizeConfig.scaledWidth(20),
      padding: EdgeInsets.all(SizeConfig.scaledWidth(5)),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: CustomColors.primaryColor,
      ),
      child: Center(
        child: Text(
          count.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.scaledFontSize(10),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
