import 'package:flutter/material.dart';
import 'package:newsapp2024/resources/dimensions.dart';
import 'package:shimmer/shimmer.dart';

class LoadingHomescreen extends StatelessWidget {
  const LoadingHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: deviceHeight * 0.05,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: deviceHeight * 0.05,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,

            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10, // You can adjust this number
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Container(
                    width: deviceWidth * 0.1,
                    height: deviceHeight * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  title: Container(
                    width: double.infinity,
                    height: 16,
                    color: Colors.white,
                  ),
                  subtitle: Container(
                    width: deviceWidth * 0.3,
                    height: 12,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
