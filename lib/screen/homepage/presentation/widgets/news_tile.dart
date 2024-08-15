import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp2024/resources/app_color.dart';
import 'package:newsapp2024/resources/dimensions.dart';
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
  const NewsTile({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.source,
    required this.time,
    required this.content,
    required this.description,
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
            width: deviceWidth * 0.01,
          ),
          Container(
            height: 96,
            width: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 96,
                        width: 96,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NewsCategoryLabel(
                  source: source,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SourceLogo(
                      source: source,
                      radius: 10,
                    ),
                    const SizedBox(width: 4),
                    CustomTextWidget(
                      text: source,
                      fontsize: fontSize13,
                      fontweight: FontWeight.w600,
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      'assets/icons/time.svg',
                      height: 12,
                    ),
                    const SizedBox(width: 5),
                    CustomTextWidget(
                        text: '${time}h ago ',
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
