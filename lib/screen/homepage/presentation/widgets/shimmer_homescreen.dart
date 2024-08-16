import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp2024/resources/dimensions.dart';
import 'package:shimmer/shimmer.dart';

class LoadingHomescreen extends StatelessWidget {
  const LoadingHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight * 0.9,
      width: deviceWidth,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                height: 96.sp,
                width: 96.sp,
                color: Colors.white,
              ),
              title: Container(
                width: double.infinity,
                height: 23.sp,
                color: Colors.white,
              ),
              subtitle: Container(
                width: double.infinity,
                height: 16.sp,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
