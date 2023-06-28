import 'package:flutter/material.dart';

class WidgetTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;

  const WidgetTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      style: const TextStyle(fontSize: 18),
      validator: validator,
    );
  }
}
