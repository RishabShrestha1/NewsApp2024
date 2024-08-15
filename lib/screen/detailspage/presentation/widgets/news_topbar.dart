import 'package:flutter/material.dart';
import 'package:newsapp2024/resources/app_color.dart';
import 'package:newsapp2024/resources/dimensions.dart';
import 'package:newsapp2024/screen/homepage/presentation/widgets/source_logo.dart';

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
            SourceLogo(source: source, radius: 25),
            SizedBox(
              width: deviceWidth * 0.013,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  source,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blacktext,
                  ),
                ),
                Text(
                  '$time hours ago',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
          ],
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 16,
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
