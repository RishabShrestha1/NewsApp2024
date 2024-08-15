import 'package:flutter/material.dart';
import 'package:newsapp2024/resources/dimensions.dart';
import 'package:shimmer/shimmer.dart';

class LoadingHomescreen extends StatelessWidget {
  const LoadingHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight * 0.9, // Adjust this value as needed
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                height: 50,
                width: 50,
                color: Colors.white,
              ),
              title: Container(
                width: double.infinity,
                height: 16,
                color: Colors.white,
              ),
              subtitle: Container(
                width: double.infinity,
                height: 12,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
