import 'package:flutter/material.dart';
import 'ui/page/home/view.dart';

/// Entrypoint of the application.
void main() {
  runApp(const MyApp());
}

/// Application itself.
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Media Viewer', home: const HomeView());
  }
}
