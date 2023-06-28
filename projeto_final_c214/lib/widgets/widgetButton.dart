import 'package:flutter/material.dart';

class Widgetbutton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const Widgetbutton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffff6600),
          foregroundColor: Colors.white,
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
