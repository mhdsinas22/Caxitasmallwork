import 'package:caxita_machinetest/common/constants/appcolors.dart';
import 'package:flutter/material.dart';

class TextsIconRowleft extends StatelessWidget {
  const TextsIconRowleft({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "View all",
          style: TextStyle(
            fontFamily: "Gilroy",
            fontSize: 12,
            color: Appcolors.appbluecolor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 1),
        Icon(Icons.arrow_forward, size: 14, color: Appcolors.appbluecolor),
      ],
    );
  }
}
