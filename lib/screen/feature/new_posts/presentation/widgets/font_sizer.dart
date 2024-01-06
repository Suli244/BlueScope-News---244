import 'dart:math';

import 'package:bluescope_news_244/widgets/spaces.dart';
import 'package:flutter/material.dart';

final class FontSizer {
  static double textScaleFactor(
    BuildContext context, {
    double maxTextScaleFactor = 2,
  }) {
    double val = (context.width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
