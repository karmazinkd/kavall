import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kavall/common/constants/app_colors.dart';
import 'package:kavall/common/constants/app_styles.dart';
import 'package:kavall/home/models/delivery_time_card_model.dart';

class DeliveryTimeCard extends StatelessWidget {
  final DeliveryTimeCardModel model;

  const DeliveryTimeCard({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
      color: AppColors.cards,
      child: ListTile(
          leading: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.storeId.toString(),
                style: AppStyles.bodyL.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text("store"),
            ],
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  "Average time: ",
                  style: AppStyles.bodyL.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(model.averageTimeText, style: AppStyles.bodyL),
              ),
            ],
          ),
          subtitle: Row(
            children: [
              Text("Worst time: ", style: AppStyles.bodyL),
              Text(model.worstTimeText, style: AppStyles.bodyM),
            ],
          )),
    );
  }
}
