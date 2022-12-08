import 'package:flutter/material.dart';
import 'package:kavall/common/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerRect extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerRect({
    required this.width,
    required this.height,
    this.borderRadius = 2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmer2,
      highlightColor: AppColors.shimmer1,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
