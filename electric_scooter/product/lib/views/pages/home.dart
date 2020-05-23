import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product/common/custom_colors.dart';
import 'package:product/common/images.dart';
import 'package:product/common/size_config.dart';
import 'package:product/controller/router.dart';
import 'package:product/model/product.dart';
import 'package:product/views/widgets/buy_now_btn.dart';
import 'package:product/views/widgets/cart.dart';
import 'package:product/views/widgets/cart_count_bubble.dart';
import 'package:product/views/widgets/textHeader.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _cartItemCount = 0;
  Product _product = Product();

  void _buyItem() {
    setState(() {
      _cartItemCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //

    final _buyBtn = GestureDetector(
      onTap: _buyItem,
      child: BuyNowButton(
        btnType: BuyBtnType.PRIMARY,
      ),
    );

    Widget _purchaseSection() {
      return Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.scaledWidth(20),
          right: SizeConfig.scaledWidth(20),
          bottom: SizeConfig.scaledWidth(30),
          top: SizeConfig.scaledWidth(40),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Total price',
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: SizeConfig.scaledFontSize(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  _product.price,
                  style: TextStyle(
                    color: CustomColors.primaryColor,
                    fontSize: SizeConfig.scaledFontSize(26),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            _buyBtn,
          ],
        ),
      );
    }

    Widget productContent() {
      return Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: _purchaseSection(),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.scaledWidth(15),
                vertical: SizeConfig.scaledHeight(20),
              ),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    Images.NAV_DRAWER,
                    fit: BoxFit.contain,
                    height: SizeConfig.scaledHeight(26),
                  ),
                  TextHeader(
                    text: _product.name,
                  ),
                  Cart(
                    count: _cartItemCount,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(SizeConfig.scaledWidth(30)),
                    bottomRight: Radius.circular(SizeConfig.scaledWidth(30)),
                  ),
                ),
                child: productContent(),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Router.detailsRoute,
                  arguments: [_cartItemCount, _product],
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.scaledHeight(18),
                ),
                child: Text(
                  'SHOW DETAILS',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: SizeConfig.scaledFontSize(18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
