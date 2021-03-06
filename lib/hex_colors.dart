import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Color blueColor = HexColor("30a9d4");
Color blueColorPersonIcon = HexColor('#0098cd');
Color orangeColor = HexColor("ff7a04");
Color whiteColor = const Color(0xFFF2F2F2);
