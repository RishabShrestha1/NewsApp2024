import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp2024/resources/dimensions.dart';
import 'package:shimmer/shimmer.dart';

class ImageBanner extends StatelessWidget {
  final String imageUrl;
  const ImageBanner({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight * 0.3,
      width: deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        shape: BoxShape.rectangle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          height: 200.sp,
          width: double.infinity,
          placeholder: (context, url) => Center(
            child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: SizedBox(
                  height: deviceHeight * 0.3,
                  width: deviceWidth,
                )),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
