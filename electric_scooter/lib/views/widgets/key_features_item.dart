import 'package:flutter/material.dart';
import 'package:product/common/images.dart';
import 'package:product/common/size_config.dart';

class KeyFeaturesItem extends StatelessWidget {
  final String image;
  final String featureName;
  const KeyFeaturesItem({
    @required this.image,
    @required this.featureName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.scaledWidth(120),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          SizeConfig.scaledWidth(10),
        ),
        color: Colors.black
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: SizeConfig.scaledHeight(160),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                SizeConfig.scaledWidth(10),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                featureName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.scaledFontSize(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
