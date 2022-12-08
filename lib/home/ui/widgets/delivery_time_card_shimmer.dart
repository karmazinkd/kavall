import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kavall/common/constants/app_colors.dart';
import 'package:kavall/common/widgets/shimmer_rect.dart';

class DeliveryTimeCardShimmer extends StatelessWidget {
  const DeliveryTimeCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
      color: AppColors.cards,
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShimmerRect(height: 20.h, width: 20.h),
          ],
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: ShimmerRect(
            height: 10.h,
            width: 180.w,
          ),
        ),
        subtitle: Align(
          alignment: Alignment.centerLeft,
          child: ShimmerRect(
            height: 10.h,
            width: 120.w,
          ),
        ),
      ),
    );
  }
}
