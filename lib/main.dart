import 'package:crud/view/Crud_Screen.dart';
import 'package:crud/controller/UserPostController.dart';
import 'package:crud/view/bottom_nav_bar.dart';
import 'package:crud/view/getpost_screen.dart';
import 'package:crud/view/nested_json_persing.dart';
import 'package:crud/view/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/product_controller.dart';

void main() {
  runApp(
      MultiProvider(
        providers:
        [
          ChangeNotifierProvider(create: (_)=>ProductController()),
          ChangeNotifierProvider(create: (_)=>UserPostController()),
        ],
        child:MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainNavBarScreen(),
    );
  }
}
