import 'package:caxita_machinetest/common/constants/appimages.dart';
import 'package:caxita_machinetest/common/constants/texts.dart';
import 'package:caxita_machinetest/common/widgets/choice_Chips_category.dart';
import 'package:caxita_machinetest/common/widgets/current_Location.dart';
import 'package:caxita_machinetest/common/widgets/images_leftside_details_container.dart';
import 'package:caxita_machinetest/common/widgets/imagesinside_text.dart';
import 'package:caxita_machinetest/common/widgets/texts_icon_rowleft.dart';
import 'package:caxita_machinetest/models/products_models.dart';
import 'package:caxita_machinetest/pages/detail_page.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Texts.boldtext(text: "Category", fontsize: 18),
                Container(width: MediaQuery.of(context).size.width * 0.20),
                TextsIconRowleft(),
              ],
            ),
            ChoiceChipsCategory(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                  InkWell(
                    onTap:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) => DetailPage(
                                  id: "p4",
                                  placename: "Rinjani Mountain",
                                  price: "\$48",
                                  location: "Lombok, Indonesia",
                                  image: Appimages.travelimage1,
                                  about:
                                      "The mighty Rinjani mountain of Gunung Rinjani is a massive volcano which towers over the island of Lombok. A climb to the top is one of the most exhilarating experiences you can have in Indonesia. At 3,726 meters tall, Gunung Rinjani is the second highest mountain in Indonesia...",
                                  qunatiy: 10,
                                  totalprice: 48,
                                ),
                          ),
                        ),
                    child: ImagesinsideText(
                      image: Appimages.travelimage1,
                      firstrowtext1: "Rinjani Mountain",
                      firstrowtext2: "\$48",
                      secondrowtext1: "Lombok, Indonesia",
                      secondrowtext2: "/Person",
                    ),
                  ),
                  ImagesinsideText(
                    image: Appimages.travelimage2,
                    firstrowtext1: "Bromo Mountain",
                    firstrowtext2: "\$48",
                    secondrowtext1: " East Java, Indonesia",
                    secondrowtext2: "",
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Texts.boldtext(text: "Popular Destination", fontsize: 18),
                  Container(width: MediaQuery.of(context).size.width * 0.10),
                  TextsIconRowleft(),
                ],
              ),
            ),
            SingleChildScrollView(
              child: ListView.builder(
                padding: EdgeInsets.only(
                  bottom: 12,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: ProductsModels.dummyproducts.length,
                itemBuilder: (context, index) {
                  final data = ProductsModels.dummyproducts[index];
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: InkWell(
                      onTap:
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) => DetailPage(
                                    id: data.id,
                                    placename: data.productname,
                                    price: data.price.toString(),
                                    location: data.location,
                                    image: data.imageurl,
                                    about: data.about,
                                    qunatiy: data.qunatity,
                                    totalprice: data.totalprice,
                                  ),
                            ),
                          ),
                      child: ImagesLeftsideDetailsContainer(
                        image: data.imageurl,
                        text1: data.productname,
                        location: data.location,
                        about: data.about,
                        person: "",
                        price: data.price.toString(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
