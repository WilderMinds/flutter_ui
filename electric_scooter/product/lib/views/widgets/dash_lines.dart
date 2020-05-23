import 'package:flutter/material.dart';
import 'package:product/common/size_config.dart';

class DashLines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableSpace = constraints.constrainWidth();
        final dashWidth = SizeConfig.scaledWidth(3);
        final dashCount = (availableSpace / (2 * dashWidth)).floor();
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (index) {
            return SizedBox(
              width: dashWidth,
              height: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
