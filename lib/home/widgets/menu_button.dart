import 'package:flutter/material.dart';

///Simple button for bottom-right menu
///
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