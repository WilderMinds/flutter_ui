import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product/common/images.dart';
import 'package:product/common/size_config.dart';

import 'cart_count_bubble.dart';

class Cart extends StatelessWidget {
  final int count;
  const Cart({@required this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: SizeConfig.scaledHeight(6),
            right: SizeConfig.scaledHeight(6),
          ),
          child: SvgPicture.asset(
            Images.CART,
            height: SizeConfig.scaledHeight(24),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: CartCountBubble(
            count: count,
          ),
        )
      ],
    );
  }
}
