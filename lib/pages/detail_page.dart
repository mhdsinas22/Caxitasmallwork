import 'package:caxita_machinetest/common/constants/appcolors.dart';
import 'package:caxita_machinetest/common/constants/appimages.dart';
import 'package:caxita_machinetest/common/constants/texts.dart';
import 'package:caxita_machinetest/common/widgets/icon_text_rowright.dart';
import 'package:caxita_machinetest/common/widgets/preview_images.dart';
import 'package:caxita_machinetest/models/products_models.dart';
import 'package:caxita_machinetest/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.placename,
    required this.price,
    required this.location,
    required this.image,
    required this.about,
    required this.qunatiy,
    required this.id,
    required this.totalprice,
  });
  final String placename;
  final String price;
  final String location;
  final String image;
  final String about;
  final int qunatiy;
  final double totalprice;
  final String id;
  @override
  Widget build(BuildContext context) {
    final cartprovider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(width: double.infinity, height: double.infinity),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 400,
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.arrow_back, color: Colors.black, size: 18),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.favorite_border, color: Colors.red, size: 18),
            ),
          ),

          Positioned(
            top: 350,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Texts.boldtext(text: placename, fontsize: 18),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.040,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Texts.boldtext(
                                      text: price.toString(),
                                      fontsize: 24,
                                    ),
                                    Texts.thicktext(
                                      "/Person",
                                      fontsize: 12,
                                      color: Appcolors.appdarkgreycolor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconTextRowright(
                          text: location,
                          size: 14,
                          color: Appcolors.appbluecolor,
                        ),
                      ],
                    ),

                    Text(
                      maxLines: 6,
                      about,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Gilroy",
                        color: Appcolors.appdarkgreycolor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Texts.boldtext(text: "Preview", fontsize: 18),
                        Container(
                          width: 50,
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Appcolors.appgreycolor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                size: 12,
                                color: Appcolors.appgoldyellowcolor,
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.020,
                              ),
                              Texts.semiText(
                                text: "4,8",
                                fontsize: 12,
                                colors: Appcolors.appdarkgreycolor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PreviewImages(imagepath: Appimages.preview1),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.04,
                          ),
                          PreviewImages(imagepath: Appimages.preview2),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.04,
                          ),
                          PreviewImages(imagepath: Appimages.preview3),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.04,
                          ),
                          PreviewImages(imagepath: Appimages.preview4),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            try {
                              print({"totalprice${totalprice}"});
                              return cartprovider.addToCart(
                                ProductsModels(
                                  qunatity: qunatiy,
                                  id: id,
                                  productname: placename,
                                  price: totalprice,
                                  imageurl: image,
                                  about: about,
                                  location: location,
                                  totalprice: totalprice,
                                ),
                                context,
                              );
                            } catch (e) {
                              print("BOOKING ERROR ${e.toString()}");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Appcolors.appbluecolor,
                          ),
                          child: Texts.boldtext(
                            text: "Book Now",
                            fontsize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
