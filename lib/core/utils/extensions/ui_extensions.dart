import 'package:flutter/material.dart';

extension GradientExtensions on LinearGradient {
  LinearGradient get reversed {
    return LinearGradient(
      colors: colors.reversed.toList(),
      begin: begin,
      end: end,
    );
  }
}

extension NumExtensions on num {
  num get setForTop {
    return this - 47;
  }
}
