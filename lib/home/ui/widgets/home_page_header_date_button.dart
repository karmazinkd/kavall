import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kavall/common/constants/app_colors.dart';
import 'package:kavall/common/constants/app_sizes.dart';
import 'package:kavall/common/constants/app_styles.dart';
import 'package:kavall/common/widgets/date_picker_button.dart';
import 'package:kavall/home/cubits/home_cubit.dart';

class HomePageHeaderDateButton extends SliverPersistentHeaderDelegate {

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0),
          )
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: AppSizes.mainPadding.w),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                "Delivery statistics",
                style: AppStyles.titleL,
                maxLines: 1,
              ),
            ),
            DatePickerButton(
              initialDate: context.read<HomeCubit>().getSelectedDate(),
              onDateSelected: (dateTime) => context.read<HomeCubit>().onDatePicked(dateTime),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}