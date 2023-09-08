import 'dart:math';

import 'package:flutter/material.dart';

class CarSearchItemModel {
  final String id = Random().nextInt(100000).toString();
  final Widget? icon;
  final String title;
  final List<CarSearchItemModel> children;

  CarSearchItemModel({
    this.icon,
    required this.title,
    this.children = const [],
  });
}
