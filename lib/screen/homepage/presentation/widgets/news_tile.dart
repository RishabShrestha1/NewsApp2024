import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp2024/resources/font_size.dart';
import 'package:newsapp2024/screen/homepage/presentation/widgets/category_label.dart';
import 'package:newsapp2024/screen/homepage/presentation/widgets/source_logo.dart';
import 'package:newsapp2024/widget/text_widget.dart';
import 'package:shimmer/shimmer.dart';

class NewsTile extends StatelessWidget {
  final String title;
  final String source;
  final String time;
  final String imageUrl;
  final String content;
  final String description;
  final String categorylabel;
  const NewsTile({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.source,
    required this.time,
    required this.content,
    required this.description,
    required this.categorylabel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          'details',
          extra: {
            'title': title,
            'source': source,
            'time': time,
            'imageUrl': imageUrl,
            'content': content,
            'description': description,
          },
        );
      },
      child: Row(
        children: [
          SizedBox(
            width: 8.sp,
          ),
          Container(
            height: 96.sp,
            width: 96.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(
                  child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 96.sp,
                        width: 96.sp,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                ),
                errorWidget: (context, url, error) => const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.error),
                    Text('Server issue'),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 5.sp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                categorylabel == 'All'
                    ? NewsCategoryLabel(
                        source: source,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      )
                    : Text(categorylabel),
                SizedBox(height: 4.sp),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.sp),
                Row(
                  children: [
                    SourceLogo(
                      source: source,
                      radius: 10,
                    ),
                    SizedBox(width: 4.sp),
                    CustomTextWidget(
                      text: source,
                      fontsize: fontSize13,
                      fontweight: FontWeight.w600,
                    ),
                    SizedBox(width: 8.sp),
                    SvgPicture.asset(
                      'assets/icons/time.svg',
                      height: 12,
                    ),
                    SizedBox(width: 5.sp),
                    CustomTextWidget(
                        text: '$time ago ',
                        fontsize: fontSize13,
                        fontweight: FontWeight.w400),
                    const Spacer(),
                    const Icon(
                      Icons.more_horiz_sharp,
                      color: Colors.grey,
                    ),
                  ],
                ),
                // Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
