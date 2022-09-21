import 'dart:developer';

import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double? _screenWidth;
  static double? _screenHeight;
  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

  static double? textMultiplier;
  static double? imageSizeMultiplier;
  static double? heightMultiplier;
  static double? widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenHeight = constraints.maxHeight;
      _screenWidth = constraints.maxWidth;
      isPortrait = true;
      if (_screenWidth! < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenHeight = constraints.maxHeight;
      _screenWidth = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockSizeHorizontal = _screenWidth! / 100;
    _blockSizeVertical = _screenHeight! / 100;

    textMultiplier = _blockSizeVertical;
    imageSizeMultiplier = _blockSizeHorizontal;
    heightMultiplier = _blockSizeVertical;
    widthMultiplier = _blockSizeHorizontal;
    // log(textMultiplier.toString(),name: 'text');
    // log(imageSizeMultiplier.toString(),name: 'image');
    // log(heightMultiplier.toString(),name: 'height');
    // log(widthMultiplier.toString(),name: 'width');
  }
}
