import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:intl/intl.dart';
import 'package:product/common/custom_colors.dart';
import 'package:product/common/fade_page_route.dart';
import 'package:product/common/images.dart';
import 'package:product/common/size_config.dart';
import 'package:product/common/slide_page_route.dart';
import 'package:product/controller/router.dart';
import 'package:product/model/product.dart';
import 'package:product/views/pages/product_details.dart';
import 'package:product/views/widgets/buy_now_btn.dart';
import 'package:product/views/widgets/cart.dart';
import 'package:product/views/widgets/cart_count_bubble.dart';
import 'package:product/views/widgets/specification_badge.dart';
import 'package:product/views/widgets/textHeader.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int unitPrice = 0;
  int _cartItemCount = 1;
  Product _product = Product();
  int _currentIndex = 0;

  final _previews = [Images.PREVIEW_1, Images.PREVIEW_2, Images.PREVIEW_3];

  @override
  void initState() {
    super.initState();
    unitPrice = _product.price;
  }

  void _buyItem() {
    setState(() {
      _cartItemCount++;
      _product.price = unitPrice * _cartItemCount;
    });
  }

  String formatPrice() {
    return NumberFormat.simpleCurrency().format(_product.price);
  }

  @override
  Widget build(BuildContext context) {
    //

    final _buyBtn = GestureDetector(
      onTap: _buyItem,
      child: Hero(
        tag: 'buyNow',
        child: BuyNowButton(
          btnType: BuyBtnType.PRIMARY,
        ),
      ),
    );

    final _swiper = Swiper(
      itemCount: 3,
      // viewportFraction: 0.8,
      // scale: 0.9,
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          _previews[index],
          fit: BoxFit.contain,
          // fit: index == 2 ? BoxFit.contain : BoxFit.cover,
        );

        // Image.network(
        //   "http://via.placeholder.com/350x150",
        //   fit: BoxFit.contain,
        // );
      },
      pagination: SwiperPagination(
        builder: DotSwiperPaginationBuilder(
            activeColor: CustomColors.primaryColor,
            color: Colors.black12,
            space: SizeConfig.scaledWidth(8),
            size: SizeConfig.scaledWidth(7)),
      ),
      autoplay: true,
      onIndexChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      // control: SwiperControl(),
    );

    Widget _purchaseSection() {
      return Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.scaledWidth(20),
          right: SizeConfig.scaledWidth(20),
          bottom: SizeConfig.scaledWidth(30),
          top: SizeConfig.scaledWidth(35),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextHeader(
              text: _product.fullName,
            ),
            SizedBox(height: SizeConfig.scaledHeight(5)),
            Text(
              _product.description,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: SizeConfig.scaledHeight(25)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
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
                        // '\$${_product.price.toString()}',
                        formatPrice(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: CustomColors.primaryColor,
                          fontSize: SizeConfig.scaledFontSize(26),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                _buyBtn,
              ],
            ),
          ],
        ),
      );
    }

    Widget productContent() {
      return Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                Expanded(child: _swiper),
                _purchaseSection(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(
                left: SizeConfig.scaledWidth(20),
                top: SizeConfig.scaledWidth(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SpecificationBadge(
                    name: _currentIndex == 0
                        ? 'km/h'
                        : _currentIndex == 1 ? 'Watts' : 'Hours',
                    value: _currentIndex == 0
                        ? _product.maxSpeed
                        : _currentIndex == 1
                            ? _product.power
                            : _product.chargeTime,
                    badgeType: BadgeType.OUTLINE,
                    height: SizeConfig.scaledHeight(100),
                  ),
                  SizedBox(height: SizeConfig.scaledHeight(15)),
                  Visibility(
                    visible: _currentIndex <= 1,
                    child: SpecificationBadge(
                      name: _currentIndex == 0 ? 'Miles range' : 'Kilogram',
                      value: _currentIndex == 0 ? _product.range : _product.weight,
                      badgeType: BadgeType.OUTLINE,
                      height: SizeConfig.scaledHeight(100),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Flexible(
                child: Container(color: Colors.white),
              ),
              Flexible(
                child: Container(color: CustomColors.primaryColor),
              ),
            ],
          ),
          SafeArea(
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
                        bottomRight:
                            Radius.circular(SizeConfig.scaledWidth(30)),
                      ),
                    ),
                    child: productContent(),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      FadePageRoute(
                        widget: ProductDetails(
                          cartCount: _cartItemCount,
                          product: _product,
                        ),
                      ),
                    );
                    // Navigator.pushNamed(
                    //   context,
                    //   Router.detailsRoute,
                    //   arguments: [_cartItemCount, _product],
                    // );
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
        ],
      ),
    );
  }
}
