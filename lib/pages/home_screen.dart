import 'package:caxita_machinetest/common/constants/appcolors.dart';
import 'package:caxita_machinetest/common/constants/appimages.dart';
import 'package:caxita_machinetest/common/constants/texts.dart';
import 'package:caxita_machinetest/common/widgets/choice_Chips_category.dart';
import 'package:caxita_machinetest/common/widgets/current_Location.dart';
import 'package:caxita_machinetest/common/widgets/texts_icon_rowleft.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: Image.asset(Appimages.drawericon),
                  ),
                  CurrentLocation(),
                  CircleAvatar(
                    backgroundImage: AssetImage(Appimages.circleavatarimg),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Texts.boldtext(text: "Category", fontsize: 18),
              Container(width: MediaQuery.of(context).size.width * 0.25),
              TextsIconRowleft(),
            ],
          ),
          ChoiceChipsCategory(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.asset(
                    Appimages.travelimage1,
                    width: 222,
                    height: 143,
                  ),
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.asset(
                    Appimages.travelimage2,
                    width: 222,
                    height: 143,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
