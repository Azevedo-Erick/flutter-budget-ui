import 'package:flutter/material.dart';

Color getColor(BuildContext context, double percent) {
  if (percent >= 0.7) {
    return Colors.red;
  } else if (percent >= 0.45 && percent < 0.7) {
    return Colors.orange;
  } else {
    return Colors.green;
  }
}
