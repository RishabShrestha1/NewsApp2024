import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsapp2024/resources/app_color.dart';
import 'package:newsapp2024/resources/dimensions.dart';
import 'package:newsapp2024/screen/homepage/presentation/widgets/category_label.dart';
import 'package:newsapp2024/screen/homepage/presentation/widgets/source_logo.dart';

class NewsTile extends StatelessWidget {
  final String title;
  final String source;
  final String time;
  final String imageUrl;
  const NewsTile({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.source,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewsCategoryLabel(Source: source),
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
                  SourceLogo(source: source),
                  const SizedBox(width: 4),
                  Text(
                    source,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColor.graybodytext,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    'assets/icons/time.svg',
                    height: 12,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${time}h ago ',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColor.graybodytext,
                    ),
                  ),
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
    );
  }
}
