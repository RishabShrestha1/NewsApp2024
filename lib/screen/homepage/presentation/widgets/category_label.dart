import 'package:flutter/material.dart';
import 'package:newsapp2024/resources/app_color.dart';

class NewsCategoryLabel extends StatelessWidget {
  final String Source;
  const NewsCategoryLabel({super.key, required this.Source});

  @override
  Widget build(BuildContext context) {
    return Text(
      Source == 'USA Today'
          ? 'Money'
          : Source == 'BBC News'
              ? 'Europe'
              : 'Travel',
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColor.graybodytext,
      ),
    );
  }
}
