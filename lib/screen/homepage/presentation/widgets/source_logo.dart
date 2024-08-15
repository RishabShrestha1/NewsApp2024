import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SourceLogo extends StatelessWidget {
  final String source;
  final double radius;
  const SourceLogo({super.key, required this.source, required this.radius});

  static const Map<String, Map<String, String>> sourceIcons = {
    'USA': {'path': 'assets/icons/usa_today_logo.jpeg', 'type': 'jpeg'},
    'BBC': {'path': 'assets/icons/bbc.svg', 'type': 'svg'},
    'CNN': {'path': 'assets/icons/cnn.svg', 'type': 'svg'},
    'national-geographic': {
      'path': 'assets/icons/national_geographic.svg',
      'type': 'svg'
    },
    'bloomberg': {'path': 'assets/icons/bloomberg.png', 'type': 'png'},
    'espn': {'path': 'assets/icons/espn.jpg', 'type': 'jpg'},
    'fox-news': {'path': 'assets/icons/fox.png', 'type': 'png'},
    'new-scientist': {'path': 'assets/icons/scientist.png', 'type': 'png'},
  };

  @override
  Widget build(BuildContext context) {
    final iconInfo = sourceIcons[source];
    if (iconInfo != null) {
      final iconPath = iconInfo['path']!;
      final iconType = iconInfo['type']!;

      if (iconType != 'svg') {
        return CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage(iconPath),
        );
      } else if (iconType == 'svg') {
        return ClipOval(
          clipBehavior: Clip.antiAlias,
          child: SvgPicture.asset(
            iconPath,
            height: 2 * radius,
          ),
        );
      }
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey,
      child: const Icon(Icons.help_outline),
    );
  }
}
