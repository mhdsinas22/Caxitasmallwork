import 'package:caxita_machinetest/pages/bottom_nav_bar.dart';

import 'package:caxita_machinetest/providers/bottom_nav_bar_provider.dart';
import 'package:caxita_machinetest/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BottomNavBar(), debugShowCheckedModeBanner: false);
  }
}
