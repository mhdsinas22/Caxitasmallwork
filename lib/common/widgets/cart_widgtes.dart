import 'package:caxita_machinetest/common/constants/appcolors.dart';
import 'package:caxita_machinetest/common/constants/sizes.dart';
import 'package:caxita_machinetest/common/widgets/TProductTitle_Text.dart';
import 'package:caxita_machinetest/common/widgets/icon_text_rowright.dart';
import 'package:caxita_machinetest/common/widgets/tCircular_Icon.dart';
import 'package:caxita_machinetest/common/widgets/tProductPrice_Text.dart';
import 'package:caxita_machinetest/common/widgets/trounded_Image.dart';
import 'package:caxita_machinetest/models/products_models.dart';
import 'package:caxita_machinetest/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartWidgtes extends StatelessWidget {
  const CartWidgtes({
    super.key,
    required this.placename,
    required this.location,
    required this.price,
    required this.imageurl,
    required this.productid,
    required this.index,
    required this.count,
    required this.changeprice,
    required this.id,
    required this.cartitems,
    required this.qunatity,
  });

  final String placename;
  final String location;
  final String price;
  final String imageurl;
  final String productid;
  final int index;
  final int count;
  final double changeprice;
  final String id;
  final ProductsModels cartitems;
  final int qunatity;

  @override
  Widget build(BuildContext context) {
    final cartprovider = Provider.of<CartProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            TroundedImage(
              height: 60,
              width: 60,
              imageurl: imageurl,
              padding: EdgeInsets.all(Sizes.sm),
              borderradius: 0,
              backgroundcolor: Colors.white,
            ),
            const SizedBox(width: Sizes.spaceBtwItems),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Tproducttitletext(
                      text: placename.toUpperCase(),
                      maxlines: 1,
                    ),
                  ),
                  IconTextRowright(
                    text: location,
                    color: Appcolors.appbluecolor,
                    size: 10,
                  ),
                  // Text.rich(
                  //   TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text: "Location ",
                  //         style: Theme.of(context).textTheme.bodySmall,
                  //       ),
                  //       TextSpan(
                  //         text: location,
                  //         style: Theme.of(context).textTheme.bodyLarge,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 75),
                TcircularIcon(
                  onPressed:
                      () => cartprovider.decrementQuantity(cartitems, context),
                  icon: Icons.minimize,
                  backgroudcolor: Appcolors.appdarkgreycolor,
                  width: 32,
                  height: 32,
                  size: Sizes.md,
                  color: Colors.white,
                ),
                const SizedBox(width: Sizes.spaceBtwItems),
                Row(
                  children: [
                    Text(
                      count.toString(),
                      style: TextTheme.of(context).titleSmall,
                    ),

                    const SizedBox(width: Sizes.spaceBtwItems),
                    TcircularIcon(
                      onPressed:
                          () => {
                            cartprovider.incrementQuantity(
                              cartitems,
                              context,
                              qunatity,
                            ),
                          },
                      icon: Icons.add,
                      backgroudcolor: Appcolors.appbluecolor,
                      width: 32,
                      height: 32,
                      size: Sizes.md,
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed:
                          () => cartprovider.removeFromCart(cartitems, context),
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
            Tproductpricetext(price: changeprice.toString()),
          ],
        ),
      ],
    );
  }
}
