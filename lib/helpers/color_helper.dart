import 'package:flutter/material.dart';

Color getColor(BuildContext context, double percent) {
  if (percent >= 0.6) {
    return Colors.green;
  } else if (percent >= 0.4 && percent < 0.6) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}
