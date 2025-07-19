import 'package:caxita_machinetest/common/constants/appcolors.dart';

import 'package:caxita_machinetest/common/constants/texts.dart';
import 'package:caxita_machinetest/common/widgets/icon_text_rowright.dart';
import 'package:flutter/material.dart';

class ImagesLeftsideDetailsContainer extends StatelessWidget {
  const ImagesLeftsideDetailsContainer({
    super.key,
    required this.image,
    required this.text1,
    required this.location,
    required this.about,
    required this.person,
    required this.price,
  });
  final String image;
  final String text1;
  final String location;
  final String about;
  final String price;
  final String person;
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 10,
      borderRadius: BorderRadius.circular(12),
      shadowColor: Colors.black.withOpacity(0.3),
      color: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: Row(
          children: [
            // // Beach Image
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Container(
                  width: 95,
                  height: 84.55,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                  ),
                ),
              ),
            ),
            // Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.boldtext(text: text1, fontsize: 14),
                    SizedBox(height: 5),
                    IconTextRowright(
                      text: location,
                      color: Appcolors.appbluecolor,
                    ),
                    SizedBox(height: 5),
                    Text(
                      about,
                      style: TextStyle(
                        color: Appcolors.appdarkgreycolor,
                        fontSize: 9,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Texts.boldtext(text: "\$$price", fontsize: 12),
                        Texts.thicktext("/Person", fontsize: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
