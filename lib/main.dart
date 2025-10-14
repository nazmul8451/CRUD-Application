import 'package:crud/Crud_Screen.dart';
import 'package:crud/controller/UserPostController.dart';
import 'package:crud/post_screen.dart';
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
        child:PostScreen(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
