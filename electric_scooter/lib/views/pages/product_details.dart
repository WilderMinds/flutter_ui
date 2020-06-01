import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:product/common/custom_colors.dart';
import 'package:product/common/images.dart';
import 'package:product/common/size_config.dart';
import 'package:product/model/product.dart';
import 'package:product/views/widgets/buy_now_btn.dart';
import 'package:product/views/widgets/cart.dart';
import 'package:product/views/widgets/key_features_item.dart';
import 'package:product/views/widgets/specification_badge.dart';
import 'package:product/views/widgets/technical_item.dart';
import 'package:product/views/widgets/textHeader.dart';

class ProductDetails extends StatefulWidget {
  final int cartCount;
  final Product product;

  const ProductDetails({@required this.cartCount, @required this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _cartCount;
  Product _product;

  @override
  void initState() {
    super.initState();

    _cartCount = widget.cartCount;
    _product = widget.product;
  }

  String formatPrice(){
    return NumberFormat.simpleCurrency().format(_product.price);
  }

  @override
  Widget build(BuildContext context) {
    final _specificationList = ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        SizedBox(width: SizeConfig.scaledWidth(20)),
        SpecificationBadge(
          name: 'Power (W)',
          value: _product.power,
          badgeType: BadgeType.FILLED,
        ),
        SizedBox(width: SizeConfig.scaledWidth(10)),
        SpecificationBadge(
          name: 'Range (miles)',
          value: _product.range,
          badgeType: BadgeType.FILLED,
        ),
        SizedBox(width: SizeConfig.scaledWidth(10)),
        SpecificationBadge(
          name: 'Speed (m/h)',
          value: _product.maxSpeed,
          badgeType: BadgeType.FILLED,
        ),
        SizedBox(width: SizeConfig.scaledWidth(10)),
        SpecificationBadge(
          name: 'Faster',
          value: '5x',
          badgeType: BadgeType.FILLED,
        ),
        SizedBox(width: SizeConfig.scaledWidth(10)),
        SpecificationBadge(
          name: 'Power (W)',
          value: _product.power,
          badgeType: BadgeType.FILLED,
        ),
        SizedBox(width: SizeConfig.scaledWidth(10)),
      ],
    );

    Widget _specificationSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.scaledWidth(20),
            ),
            child: TextHeader(
              text: 'Specification',
              color: Colors.white,
            ),
          ),
          SizedBox(height: SizeConfig.scaledHeight(10)),
          Container(
            height: SizeConfig.scaledHeight(80),
            child: _specificationList,
          ),
        ],
      );
    }

    final _technicalDataList = Column(
      children: <Widget>[
        TechnicalItem(name: 'Model', value: _product.model),
        SizedBox(height: SizeConfig.scaledHeight(10)),
        TechnicalItem(name: 'Weight', value: _product.weight),
        SizedBox(height: SizeConfig.scaledHeight(10)),
        TechnicalItem(name: 'Height', value: _product.height),
        SizedBox(height: SizeConfig.scaledHeight(10)),
        TechnicalItem(name: 'Charge time', value: _product.chargeTime),
      ],
    );

    Widget _technicalDataSection() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.scaledWidth(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextHeader(
              text: 'Technical data',
              color: Colors.white,
            ),
            SizedBox(height: SizeConfig.scaledHeight(10)),
            Container(
              child: _technicalDataList,
            ),
          ],
        ),
      );
    }

    final _featuresList = ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        SizedBox(width: SizeConfig.scaledWidth(20)),
        KeyFeaturesItem(
          image: Images.HEADLIGHTS,
          featureName: 'Headlights',
        ),
        SizedBox(width: SizeConfig.scaledWidth(10)),
        KeyFeaturesItem(
          image: Images.TAILLIGHTS,
          featureName: 'Red tail lights',
        ),
        SizedBox(width: SizeConfig.scaledWidth(10)),
        KeyFeaturesItem(
          image: Images.BRAKES,
          featureName: 'Ceramic brakes',
        ),
        SizedBox(width: SizeConfig.scaledWidth(10)),
        KeyFeaturesItem(
          image: Images.BATTERY,
          featureName: 'Extra battery',
        ),
        SizedBox(width: SizeConfig.scaledWidth(10)),
      ],
    );

    Widget _keyFeaturesSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.scaledWidth(20),
            ),
            child: TextHeader(
              text: 'Key features',
              color: Colors.white,
            ),
          ),
          SizedBox(height: SizeConfig.scaledHeight(10)),
          Container(
            height: SizeConfig.scaledHeight(190),
            child: _featuresList,
          ),
        ],
      );
    }

    final _buyBtn = GestureDetector(
      onTap: () {},
      child: BuyNowButton(
        btnType: BuyBtnType.SECONDARY,
      ),
    );

    Widget _purchaseSection() {
      return Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.scaledWidth(20),
          right: SizeConfig.scaledWidth(20),
          bottom: SizeConfig.scaledWidth(30),
          top: SizeConfig.scaledWidth(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Total price',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: SizeConfig.scaledFontSize(14),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    formatPrice(),
                    // '\$${_product.price.toString()}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
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
      );
    }

    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: SafeArea(
        child: Container(
          color: CustomColors.primaryColor,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.scaledWidth(15),
                  vertical: SizeConfig.scaledHeight(20),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(SizeConfig.scaledWidth(20)),
                    bottomRight: Radius.circular(SizeConfig.scaledWidth(20)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        Images.BACK,
                        height: SizeConfig.scaledHeight(24),
                      ),
                    ),
                    TextHeader(
                      text: '${_product.model} Details',
                    ),
                    Cart(
                      count: _cartCount,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: SizeConfig.scaledWidth(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: SizeConfig.scaledHeight(10)),
                        _specificationSection(),
                        SizedBox(height: SizeConfig.scaledHeight(40)),
                        _technicalDataSection(),
                        SizedBox(height: SizeConfig.scaledHeight(40)),
                        _keyFeaturesSection(),
                        // SizedBox(height: SizeConfig.scaledHeight(60)),
                        // _purchaseSection()
                      ],
                    ),
                  ),
                ),
              ),
              //SizedBox(height: SizeConfig.scaledHeight(60)),
              _purchaseSection()
            ],
          ),
        ),
      ),
    );
  }
}
