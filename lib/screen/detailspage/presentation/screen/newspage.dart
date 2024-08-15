import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp2024/resources/app_color.dart';
import 'package:newsapp2024/resources/font_size.dart';
import 'package:newsapp2024/screen/detailspage/presentation/widgets/image_banner.dart';
import 'package:newsapp2024/screen/detailspage/presentation/widgets/news_topbar.dart';
import 'package:newsapp2024/screen/homepage/presentation/widgets/category_label.dart';
import 'package:newsapp2024/widget/text_widget.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final String source;
  final String time;
  final String imageUrl;
  final String description;
  final String content;

  const DetailsScreen({
    super.key,
    required this.title,
    required this.source,
    required this.time,
    required this.imageUrl,
    required this.description,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.sp),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.sp,
          ),
          child: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share_outlined,
                  size: 24,
                  weight: 24.sp,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  size: 24,
                  weight: 24.sp,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.sp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewsDetailsTopBar(source: source, time: time),
              SizedBox(height: 16.sp),
              ImageBanner(imageUrl: imageUrl),
              SizedBox(height: 16.sp),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NewsCategoryLabel(
                    source: source,
                    fontSize: fontSize14,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 4.sp),
                  CustomTextWidget.selectedcolour(
                    text: title,
                    fontsize: fontSize24,
                    fontweight: FontWeight.w500,
                    selectedcolour: AppColor.blacktext,
                  ),
                  SizedBox(height: 16.sp),
                  CustomTextWidget(
                    text: description,
                    fontsize: fontSize16,
                    fontweight: FontWeight.w400,
                  ),
                  SizedBox(height: 18.sp),
                  CustomTextWidget(
                      text: content,
                      fontsize: fontSize16,
                      fontweight: FontWeight.w400),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
