import 'package:caxita_machinetest/common/constants/appcolors.dart';
import 'package:caxita_machinetest/common/constants/appimages.dart';
import 'package:caxita_machinetest/pages/cart_screen.dart';
import 'package:caxita_machinetest/pages/favotrie_screen.dart';
import 'package:caxita_machinetest/pages/home_screen.dart';
import 'package:caxita_machinetest/pages/profile_screen.dart';
import 'package:caxita_machinetest/providers/bottom_nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomeScreen(),
      FavotrieScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
    final navprovider = Provider.of<BottomNavBarProvider>(context);
    return Scaffold(
      body: IndexedStack(index: navprovider.currentindex, children: pages),
      bottomNavigationBar: ClipRRect(
        child: BottomNavigationBar(
          onTap: (value) => navprovider.changeindex(value),
          unselectedItemColor: Appcolors.appdarkgreycolor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Appcolors.appbluecolor,
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Image.asset(
                      Appimages.homeicon,
                      color:
                          navprovider.currentindex == 0
                              ? Appcolors.appbluecolor
                              : Appcolors.appdarkgreycolor,
                      width: navprovider.currentindex == 0 ? 28 : 24,
                      height: navprovider.currentindex == 0 ? 28 : 24,
                    ),
                  ),
                  SizedBox(height: 3),
                  navprovider.currentindex == 0
                      ? Container(
                        width: 9.04,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Appcolors.appbluecolor,
                        ),
                      )
                      : Container(),
                ],
              ),

              label: "",
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOutExpo,
                child: Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      color:
                          navprovider.currentindex == 1
                              ? Appcolors.appbluecolor
                              : Appcolors.appdarkgreycolor,
                    ),
                    SizedBox(height: 3),
                    navprovider.currentindex == 1
                        ? Container(
                          width: 9.04,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Appcolors.appbluecolor,
                          ),
                        )
                        : Container(),
                  ],
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color:
                        navprovider.currentindex == 2
                            ? Appcolors.appbluecolor
                            : Appcolors.appdarkgreycolor,
                  ),
                  SizedBox(height: 3),
                  navprovider.currentindex == 2
                      ? Container(
                        width: 9.04,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Appcolors.appbluecolor,
                        ),
                      )
                      : Container(),
                ],
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(
                    Icons.person,
                    color:
                        navprovider.currentindex == 3
                            ? Appcolors.appbluecolor
                            : Appcolors.appdarkgreycolor,
                  ),
                  SizedBox(height: 3),
                  navprovider.currentindex == 3
                      ? Container(
                        width: 9.04,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Appcolors.appbluecolor,
                        ),
                      )
                      : Container(),
                ],
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
