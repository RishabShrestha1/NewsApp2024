import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp2024/resources/app_color.dart';

class NewsCategoryLabel extends StatelessWidget {
  final String source;
  final double fontSize;
  final FontWeight fontWeight;
  const NewsCategoryLabel(
      {super.key,
      required this.source,
      required this.fontSize,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      source == 'USA Today'
          ? 'Money'
          : source == 'BBC News'
              ? 'Europe'
              : 'Travel',
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'Poppins',
        letterSpacing: 0.12.sp,
        color: AppColor.graybodytext,
      ),
    );
  }
}
