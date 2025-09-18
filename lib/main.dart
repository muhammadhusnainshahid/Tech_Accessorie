import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tech_accessories_app/provider/bottomNavBar_provider.dart';

import 'package:tech_accessories_app/components/nottom_nav_bar.dart';
import 'package:tech_accessories_app/provider/cart_provider.dart';
import 'package:tech_accessories_app/provider/explore_provider.dart';
import 'package:tech_accessories_app/provider/product_provider.dart';
import 'package:device_preview/device_preview.dart'; // 👈 added

void main() {
  runApp(
    DevicePreview(
      enabled: true, // production build me false rakhna
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BottomnavbarProvider()),
          ChangeNotifierProvider(create: (_) => ProductProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => ExploreProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tech Accessories App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: BottomNavBar(),
          // 👇 DevicePreview support
          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
        ),
      ),
    );
  }
}
