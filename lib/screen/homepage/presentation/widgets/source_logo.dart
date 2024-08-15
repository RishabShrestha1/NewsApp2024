import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SourceLogo extends StatelessWidget {
  final String source;
  final double radius;
  const SourceLogo({super.key, required this.source, required this.radius});

  @override
  Widget build(BuildContext context) {
    return source.contains('USA')
        ? CircleAvatar(
            radius: radius,
            backgroundImage:
                const AssetImage('assets/icons/usa_today_logo.jpeg'),
          )
        : ClipOval(
            clipBehavior: Clip.antiAlias,
            child: SvgPicture.asset(
              source.contains('BBC')
                  ? 'assets/icons/bbc.svg'
                  : 'assets/icons/cnn.svg',
              height: 2 * radius,
            ),
          );
  }
}
