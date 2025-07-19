import 'package:caxita_machinetest/common/constants/appanimations.dart';
import 'package:caxita_machinetest/common/constants/texts.dart';
import 'package:caxita_machinetest/common/widgets/cart_widgtes.dart';
import 'package:caxita_machinetest/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartprovider = Provider.of<CartProvider>(context);
    return Scaffold(
      body:
          cartprovider.cartitems.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(Appanimations.nocartitems, width: 300),
                    SizedBox(height: 20),
                    Texts.boldtext(
                      text: "NO ADDED TO CART",
                      fontsize: 25,
                      color: Colors.grey,
                    ),
                  ],
                ),
              )
              : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListView.separated(
                        separatorBuilder:
                            (context, index) => const SizedBox(height: 10),
                        shrinkWrap: true,
                        itemCount: cartprovider.cartlength,
                        itemBuilder: (context, index) {
                          final item = cartprovider.cartitems[index];
                          return Column(
                            children: [
                              CartWidgtes(
                                id: item.id,
                                count: item.count,
                                imageurl: item.imageurl,
                                placename: item.productname,
                                location: item.location,
                                price: item.price.toString(),
                                productid: item.id,
                                index: index,
                                changeprice: item.totalprice,
                                cartitems: item,
                                qunatity: item.qunatity,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  cartprovider.cartitems.isNotEmpty
                      ? Padding(
                        padding: EdgeInsets.all(12),
                        child: Material(
                          borderRadius: BorderRadius.circular(12),
                          elevation: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            width: 370,
                            height: 93,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: 30),
                                    Texts.boldtext(
                                      text: "TOTAL",
                                      fontsize: 11,
                                      color: Colors.brown,
                                    ),
                                    Texts.boldtext(
                                      text: "\$${cartprovider.totalprice}",
                                      fontsize: 18,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 60),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: 140,
                                  height: 38,
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Texts.boldtext(
                                        text:
                                            "CheckOut(${cartprovider.cartlength} items)",
                                        color: Colors.white,
                                        fontsize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      : Text(""),
                ],
              ),
      backgroundColor: Colors.white,
    );
  }
}
