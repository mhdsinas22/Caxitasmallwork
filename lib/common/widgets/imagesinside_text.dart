import 'package:caxita_machinetest/common/constants/texts.dart';
import 'package:caxita_machinetest/common/widgets/icon_text_rowright.dart';
import 'package:flutter/material.dart';

class ImagesinsideText extends StatelessWidget {
  const ImagesinsideText({
    super.key,
    required this.image,
    required this.firstrowtext1,
    required this.firstrowtext2,
    required this.secondrowtext1,
    required this.secondrowtext2,
  });
  final String image;
  final String firstrowtext1;
  final String firstrowtext2;
  final String secondrowtext1;
  final String secondrowtext2;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 222,
          height: 143,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            image: DecorationImage(image: AssetImage(image)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Texts.boldtext(
                      text: firstrowtext1,
                      fontsize: 12,
                      color: Colors.white,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.10),
                    Texts.boldtext(
                      text: firstrowtext2,
                      fontsize: 12,
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconTextRowright(text: secondrowtext1),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Texts.thicktext(
                      secondrowtext2,
                      color: Colors.white,
                      fontsize: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
