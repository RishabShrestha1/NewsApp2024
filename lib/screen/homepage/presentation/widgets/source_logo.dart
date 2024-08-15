import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SourceLogo extends StatelessWidget {
  final String source;
  final double radius;

  const SourceLogo({super.key, required this.source, required this.radius});

  static const List<Map<String, String>> sourceIcons = [
    {'name': 'USA', 'path': 'assets/icons/usa_today_logo.jpeg', 'type': 'jpeg'},
    {'name': 'BBC', 'path': 'assets/icons/bbc.svg', 'type': 'svg'},
    {'name': 'CNN', 'path': 'assets/icons/cnn.svg', 'type': 'svg'},
    {'name': 'geographic', 'path': 'assets/icons/nat_geo.png', 'type': 'png'},
    {'name': 'bloomberg', 'path': 'assets/icons/bloomberg.png', 'type': 'png'},
    {'name': 'espn', 'path': 'assets/icons/espn.jpg', 'type': 'jpg'},
    {'name': 'fox', 'path': 'assets/icons/fox.png', 'type': 'png'},
    {'name': 'new', 'path': 'assets/icons/scientist.png', 'type': 'png'},
  ];

  @override
  Widget build(BuildContext context) {
    final iconInfo = sourceIcons.firstWhere(
        (icon) => source.toLowerCase().contains(icon['name']!.toLowerCase()),
        orElse: () => {'path': '', 'type': 'jpeg'});

    final iconPath = iconInfo['path']!;
    final iconType = iconInfo['type']!;

    log('Using iconPath: $iconPath with type: $iconType');

    if (iconType == 'svg') {
      return ClipOval(
        clipBehavior: Clip.antiAlias,
        child: SvgPicture.asset(
          iconPath,
          fit: BoxFit.fill,
          height: 2 * radius,
        ),
      );
    } else if (iconType == 'png' || iconType == 'jpg' || iconType == 'jpeg') {
      return CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(
          iconPath,
        ),
      );
    }
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey,
      child: const Icon(Icons.help_outline),
    );
  }
}
