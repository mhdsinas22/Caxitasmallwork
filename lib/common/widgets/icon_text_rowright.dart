import 'package:caxita_machinetest/common/constants/texts.dart';
import 'package:flutter/material.dart';

class IconTextRowright extends StatelessWidget {
  const IconTextRowright({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.size = 10,
  });
  final String text;
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on, color: color, size: size),
        Texts.thicktext(text, color: color, fontsize: size),
      ],
    );
  }
}
