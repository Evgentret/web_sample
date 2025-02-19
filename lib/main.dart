import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home/home_controller.dart';
import 'home/home_view.dart';

/// Entrypoint of the application.
void main() {
  //creating instance of screen controller to ensure
  //TODO refactor this call without "permanent" with binding in general use
  HomeController hcl = Get.put(HomeController(), permanent: true);
  // registering view factory for <img> element
  hcl.registerImageElement();

  runApp(const MyApp());
}

/// Application itself.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: const HomePage());
  }
}
