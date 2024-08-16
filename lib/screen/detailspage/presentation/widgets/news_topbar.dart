import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp2024/resources/app_color.dart';
import 'package:newsapp2024/resources/font_size.dart';
import 'package:newsapp2024/screen/homepage/presentation/widgets/source_logo.dart';
import 'package:newsapp2024/widget/text_widget.dart';

class NewsDetailsTopBar extends StatelessWidget {
  final String source;
  final String time;
  const NewsDetailsTopBar(
      {super.key, required this.source, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            SourceLogo(source: source, radius: 25.sp),
            SizedBox(width: 4.sp),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget.selectedcolour(
                  text: source,
                  fontsize: fontSize16,
                  fontweight: FontWeight.w600,
                  selectedcolour: AppColor.blacktext,
                ),
                CustomTextWidget(
                  text: '$time ago',
                  fontsize: fontSize14,
                  fontweight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.elevatedColor,
            foregroundColor: AppColor.white,
            padding: EdgeInsets.symmetric(
              horizontal: 12.sp,
              vertical: 5.sp,
            ),
            textStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: const Text('Following'),
        ),
      ],
    );
  }
}
