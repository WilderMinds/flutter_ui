import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;

  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double _safeAreaWidth;
  static double _safeAreaHeight;
  static double _safeBlockWidth;
  static double _safeBlockHeight;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;

  void init(BuildContext context, BoxConstraints constraints,
      Orientation orientation) {
    _mediaQueryData = MediaQuery.of(context);

    _safeAreaWidth =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaHeight =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
    }

    // full screen
    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    // safe area
    _safeBlockWidth = (_screenWidth - _safeAreaWidth) / 100;
    _safeBlockHeight = (_screenHeight - _safeAreaHeight) / 100;

    textMultiplier = _safeBlockHeight;
    imageSizeMultiplier = _safeBlockWidth;
    heightMultiplier = _safeBlockHeight;
    widthMultiplier = _safeBlockWidth;

    // print('width is $_safeBlockWidth');
    // print('height is $_safeBlockHeight');
  }

  static double scaledHeight(double height){
    return (height / 8.18) * heightMultiplier;
  }

  static double scaledWidth(double width){
    return (width / 4.14) * widthMultiplier;
  }

  static double scaledFontSize(double size){
    return (size / 8.18) * heightMultiplier;
  }
}
