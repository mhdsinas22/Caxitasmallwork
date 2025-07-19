import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Texts {
  static Text thicktext(String text, {Color? color, double fontsize = 12}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.w200,
        fontFamily: "Gilroy",
        color: color,
      ),
    );
  }

  static Text semiText({
    required String text,
    required double fontsize,
    Color colors = Colors.black,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.w600,
        fontFamily: "Gilroy",
        color: colors,
      ),
    );
  }

  static Text boldtext({
    required String text,
    required double fontsize,
    Color? color,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.bold,
        fontFamily: "Gilory",
        color: color,
      ),
    );
  }
}
