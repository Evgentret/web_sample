import 'package:flutter/material.dart';

///Simple text button for bottom-right menu of HomeView.
///
/// hardcoded width: 150.
Widget menuButton({required String text, required VoidCallback onPressed}) {
  return SizedBox(
    width: 150,
    child: TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text),
      ),
    ),
  );
}