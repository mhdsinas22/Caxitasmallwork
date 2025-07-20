import 'package:caxita_machinetest/common/constants/appcolors.dart';
import 'package:caxita_machinetest/common/constants/appimages.dart';
import 'package:caxita_machinetest/common/constants/texts.dart';
import 'package:flutter/material.dart';

class ChoiceChipsCategory extends StatelessWidget {
  const ChoiceChipsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.045),
            ChoiceChip(
              onSelected: (value) {},
              backgroundColor: Appcolors.appgreycolor,
              label: Row(
                children: [
                  Image.asset(Appimages.choiceicon1),
                  const SizedBox(width: 2),
                  Texts.thicktext("Mountain"),
                ],
              ),
              selected: false,
              showCheckmark: false,
              side: BorderSide(color: Colors.transparent),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            SizedBox(
              child: ChoiceChip(
                onSelected: (value) {},
                backgroundColor: Appcolors.appgreycolor,
                label: Row(
                  children: [
                    Image.asset(Appimages.choicechipicon2),
                    const SizedBox(width: 2),
                    Texts.thicktext("Waterfall"),
                  ],
                ),
                selected: false,
                showCheckmark: false,
                side: BorderSide(color: Colors.transparent),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            ChoiceChip(
              onSelected: (value) {},
              backgroundColor: Appcolors.appgreycolor,
              label: Row(
                children: [
                  Image.asset(Appimages.choicechipicon3),
                  const SizedBox(width: 2),
                  Texts.thicktext("River"),
                ],
              ),
              selected: false,
              showCheckmark: false,
              side: BorderSide(color: Colors.transparent),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            SizedBox(
              width: 86,
              height: 38,
              child: ChoiceChip(
                onSelected: (value) {},
                backgroundColor: Appcolors.appgreycolor,
                label: Row(
                  children: [
                    Image.asset(Appimages.choicechipicon4),
                    const SizedBox(width: 2),
                    Texts.thicktext("Forest"),
                  ],
                ),
                selected: false,
                showCheckmark: false,
                side: BorderSide(color: Colors.transparent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
