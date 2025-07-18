import 'package:caxita_machinetest/common/constants/appcolors.dart';
import 'package:caxita_machinetest/common/constants/texts.dart';
import 'package:flutter/material.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Texts.thicktext("Current Location"),
        const SizedBox(height: 3),
        Row(
          children: [
            Icon(Icons.location_on, color: Appcolors.appbluecolor, size: 14),
            Texts.semiText(text: "Denpasar, Bali", fontsize: 14),
          ],
        ),
      ],
    );
  }
}
