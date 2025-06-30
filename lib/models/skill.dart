import 'package:flutter/material.dart';

class Skill {
  final String name;
  final IconData? icon; // Make icon nullable

  Skill({
    required this.name,
    this.icon, // Remove 'required'
  });
}