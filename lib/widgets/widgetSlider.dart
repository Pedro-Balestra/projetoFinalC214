import 'package:flutter/material.dart';

class WidgetSlider extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final String labelText;
  final String label;
  final int divisions;
  final ValueChanged<double>? onChanged;

  const WidgetSlider({
    Key? key,
    required this.value,
    required this.min,
    required this.max,
    required this.labelText,
    required this.label,
    required this.divisions,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          label: "$label $value %",
          divisions: divisions,
          activeColor: const Color(0xffff6600),
          inactiveColor: Colors.orange[100],
          onChanged: onChanged,
        ),
      ],
    );
  }
}
