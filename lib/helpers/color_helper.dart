import 'package:flutter/material.dart';

Color getColor(BuildContext context, double percent) {
  if (percent >= 0.65) {
    return Colors.red;
  } else if (percent >= 0.55 && percent < 0.65) {
    return Colors.orange;
  } else {
    return Colors.green;
  }
}
