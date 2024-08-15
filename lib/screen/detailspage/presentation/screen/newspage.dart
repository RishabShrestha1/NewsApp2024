import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsapp2024/resources/app_color.dart';
import 'package:newsapp2024/resources/dimensions.dart';
import 'package:newsapp2024/screen/detailspage/presentation/widgets/image_banner.dart';
import 'package:newsapp2024/screen/detailspage/presentation/widgets/news_topbar.dart';
import 'package:newsapp2024/screen/homepage/presentation/widgets/category_label.dart';
import 'package:newsapp2024/screen/homepage/presentation/widgets/source_logo.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final String source;
  final String time;
  final String imageUrl;
  final String content;

  const DetailsScreen({
    super.key,
    required this.title,
    required this.source,
    required this.time,
    required this.imageUrl,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewsDetailsTopBar(source: source, time: time),
              ImageBanner(imageUrl: imageUrl),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NewsCategoryLabel(
                    source: source,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColor.blacktext,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(content),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
