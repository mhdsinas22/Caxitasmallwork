import 'package:caxita_machinetest/common/constants/appimages.dart';

class ProductsModels {
  final String id;
  final String productname;
  final double price;
  final String imageurl;
  final String about;
  final String location;
  final int qunatity;
  double totalprice;
  int count;
  ProductsModels({
    required this.id,
    required this.productname,
    required this.price,
    required this.imageurl,
    this.count = 1,
    required this.about,
    required this.location,
    required this.qunatity,
    this.totalprice = 0,
  });

  static List<ProductsModels> dummyproducts = [
    ProductsModels(
      id: "p1",
      productname: "The Pink Beach",
      totalprice: 48,
      price: 48,
      imageurl: Appimages.popluardestinonimage1,
      qunatity: 12,
      about:
          "This exceptional beach gets its striking color from microscopic animals called...",
      location: "Komodo Island, Indonesia",
    ),
    ProductsModels(
      id: "p2",
      productname: "Meru Tower",
      price: 36,
      imageurl: Appimages.populardestinoimage2,
      qunatity: 11,
      about:
          "A Meru tower or pelinggih meru is the principal shrine of a Balinese temple. It is a wooden..",
      location: "Bali, Indonesia",
      totalprice: 36,
    ),
    ProductsModels(
      id: "p3",
      productname: "Toraja Land",
      price: 36,
      totalprice: 36,
      imageurl: Appimages.populardestinonimage3,
      qunatity: 11,
      about:
          "A Meru tower or pelinggih meru is the principal shrine of a Balinese temple. It is a wooden..",
      location: "South Sulawesi, Indonesia",
    ),
    ProductsModels(
      id: "p4",
      productname: "Rinjani Moutain",
      price: 48,
      totalprice: 48,
      imageurl: Appimages.travelimage1,
      qunatity: 10,
      about:
          "This exceptional beach gets its striking color from microscopic animals called...",
      location: "Lombok, Indonesia",
    ),
  ];
}
