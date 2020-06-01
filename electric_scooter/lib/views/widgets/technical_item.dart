import 'package:flutter/material.dart';
import 'package:product/common/custom_colors.dart';
import 'package:product/common/size_config.dart';
import 'package:product/views/widgets/dash_lines.dart';

class TechnicalItem extends StatelessWidget {
  final String name;
  final String value;

  const TechnicalItem({
    @required this.name,
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.scaledFontSize(18),
            fontWeight: FontWeight.w300,
          ),
        ),
         SizedBox(width: SizeConfig.scaledWidth(8)),
        Expanded(
          child: DashLines(),
        ),
         SizedBox(width: SizeConfig.scaledWidth(8)),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.scaledFontSize(18),
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
