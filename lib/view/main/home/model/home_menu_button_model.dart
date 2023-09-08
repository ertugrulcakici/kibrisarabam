import 'package:flutter/widgets.dart';

class HomeMenuButtonModel {
  final String title;
  final String subtitle;
  final Widget icon;
  final bool logoOnLeft;
  final bool isLargeTitled;
  final double x, y, w, h;
  const HomeMenuButtonModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.logoOnLeft,
    required this.isLargeTitled,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
  });
}
