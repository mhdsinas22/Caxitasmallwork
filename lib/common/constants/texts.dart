import 'package:flutter/cupertino.dart';

class Texts {
  static Text thicktext(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w200,
        fontFamily: "Gilroy",
      ),
    );
  }

  static Text semiText({required String text, required double fontsize}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.w600,
        fontFamily: "Gilroy",
      ),
    );
  }

  static Text boldtext({required String text, required double fontsize}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.bold,
        fontFamily: "Gilory",
      ),
    );
  }
}
