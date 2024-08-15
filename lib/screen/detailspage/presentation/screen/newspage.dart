import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                  ),
                  const SizedBox(height: 8),
                  Text('Source: $source'),
                  Text('Published: $time hours ago'),
                  const SizedBox(height: 16),
                  Text(content),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
