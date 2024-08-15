import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp2024/resources/dimensions.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;
  const ErrorMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: deviceHeight * 0.1),
        Text(
          'Something went wrong',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
        Icon(Icons.error_outline_rounded, size: deviceWidth * 0.5),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(message,
              style: TextStyle(
                fontSize: 16.sp,
              )),
        ),
      ],
    );
  }
}
