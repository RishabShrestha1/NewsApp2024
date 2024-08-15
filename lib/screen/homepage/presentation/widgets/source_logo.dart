import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SourceLogo extends StatelessWidget {
  final String source;
  const SourceLogo({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return source.contains('USA')
        ? const CircleAvatar(
            radius: 10,
            backgroundImage: AssetImage('assets/icons/usa_today_logo.jpeg'),
          )
        : ClipOval(
            clipBehavior: Clip.antiAlias,
            child: SvgPicture.asset(
              source.contains('BBC')
                  ? 'assets/icons/bbc.svg'
                  : 'assets/icons/cnn.svg',
              height: 20,
            ),
          );
  }
}
