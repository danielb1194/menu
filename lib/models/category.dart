import 'package:flutter/material.dart';

class Category {
  Category({
    required this.name,
    required this.backgroundColor,
  });

  final String name;
  final Color backgroundColor;
  final String id = UniqueKey().toString();
}
