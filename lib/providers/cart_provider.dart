import 'package:caxita_machinetest/common/constants/appanimations.dart';
import 'package:caxita_machinetest/common/constants/appcolors.dart';
import 'package:caxita_machinetest/common/constants/texts.dart';
import 'package:caxita_machinetest/models/products_models.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CartProvider with ChangeNotifier {
  final List<ProductsModels> _cartitems = [];
  List<ProductsModels> get cartitems => _cartitems;
  void addToCart(ProductsModels productmodels, BuildContext context) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(color: Colors.white),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(Appanimations.nocartitems),
              Texts.boldtext(
                text: "ADDING TO CART",
                fontsize: 20,
                color: Colors.black26,
              ),
            ],
          ),
        );
      },
    );
    await Future.delayed(Duration(seconds: 3));
    final index = _cartitems.indexWhere((item) => item.id == productmodels.id);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    if (index == -1) {
      _cartitems.add(productmodels);
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.close, size: 30, color: Colors.black),
                      ),
                    ],
                  ),
                  Lottie.asset(Appanimations.gpayanimation),
                  Texts.boldtext(
                    text: "Added to cart! Ready for checkout",
                    fontsize: 13,
                    color: Appcolors.appdarkgreycolor,
                  ),
                ],
              ),
            ),
          );
        },
      );
      await Future.delayed(Duration(seconds: 2));
      Navigator.pop(context);
      notifyListeners();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.close, size: 30, color: Colors.black),
                      ),
                    ],
                  ),
                  Lottie.asset(Appanimations.nodata),
                  Texts.boldtext(
                    text: "Sorry Already added",
                    fontsize: 20,
                    color: Appcolors.appdarkgreycolor,
                  ),
                ],
              ),
            ),
          );
        },
      );
      await Future.delayed(Duration(seconds: 2));
      Navigator.pop(context);
    }
  }

  void removeFromCart(
    ProductsModels productmodels,
    BuildContext context,
  ) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(color: Colors.white),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(Appanimations.deleteingtheproduct),
              Texts.boldtext(
                text: "DELETING",
                fontsize: 20,
                color: Colors.black26,
              ),
            ],
          ),
        );
      },
    );
    await Future.delayed(Duration(seconds: 2));
    Navigator.pop(context);
    _cartitems.remove(productmodels);
    notifyListeners();
  }

  void incrementQuantity(
    ProductsModels productmodels,
    BuildContext context,
    int qunatity,
  ) {
    final index = _cartitems.indexOf(productmodels);
    if (index != -1) {
      print(qunatity);
      if (_cartitems[index].count < qunatity) {
        _cartitems[index].count++;
        _cartitems[index].totalprice =
            _cartitems[index].price * _cartitems[index].count;
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Maximum Ticket limit reached for ${productmodels.productname}',
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  void decrementQuantity(
    ProductsModels productmodels,
    BuildContext context,
  ) async {
    final index = cartitems.indexOf(productmodels);
    if (index != -1 && _cartitems[index].count > 1) {
      _cartitems[index].count--;
      _cartitems[index].totalprice =
          _cartitems[index].price * _cartitems[index].count;
      notifyListeners();
    } else if (_cartitems[index].count == 1) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(color: Colors.white),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(Appanimations.deleteingtheproduct),
                Texts.boldtext(
                  text: "DELETING",
                  fontsize: 20,
                  color: Colors.black26,
                ),
              ],
            ),
          );
        },
      );
      await Future.delayed(Duration(seconds: 2));
      Navigator.pop(context);
      _cartitems.removeAt(index);
      notifyListeners();
    }
  }

  int get cartlength => _cartitems.length;
  double get totalprice =>
      _cartitems.fold(0, (sum, item) => sum + item.totalprice);
}
