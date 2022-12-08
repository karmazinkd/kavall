import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kavall/common/constants/app_colors.dart';
import 'package:kavall/common/helpers/extensions.dart';
import 'package:kavall/common/helpers/injections.dart';
import 'package:kavall/gen/assets.gen.dart';
import 'package:kavall/home/cubits/home_cubit.dart';
import 'package:kavall/home/cubits/home_state.dart';
import 'package:kavall/home/models/delivery_time_card_model.dart';
import 'package:kavall/home/repositories/i_delivery_time_repository.dart';
import 'package:kavall/home/ui/widgets/delivery_time_card.dart';
import 'package:kavall/home/ui/widgets/delivery_time_card_shimmer.dart';
import 'package:kavall/home/ui/widgets/home_page_header_date_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///  use these models to see how header hides while scrolling:
  static const List<DeliveryTimeCardModel> dummyModels = [
    DeliveryTimeCardModel(
      storeId: 1,
      averageTimeText: "8 min 34 sec",
      worstTimeText: "15 min 59 sec",
    ),
    DeliveryTimeCardModel(
      storeId: 12,
      averageTimeText: "90 min 31 sec",
      worstTimeText: "110 min 55 sec",
    ),
    DeliveryTimeCardModel(
      storeId: 2,
      averageTimeText: "11 min 34 sec",
      worstTimeText: "20 min 20 sec",
    ),
    DeliveryTimeCardModel(
      storeId: 5,
      averageTimeText: "9 min 33 sec",
      worstTimeText: "209 min 19 sec",
    ),
    DeliveryTimeCardModel(
      storeId: 1,
      averageTimeText: "8 min 34 sec",
      worstTimeText: "15 min 59 sec",
    ),
    DeliveryTimeCardModel(
      storeId: 12,
      averageTimeText: "90 min 31 sec",
      worstTimeText: "110 min 55 sec",
    ),
    DeliveryTimeCardModel(
      storeId: 2,
      averageTimeText: "11 min 34 sec",
      worstTimeText: "20 min 20 sec",
    ),
    DeliveryTimeCardModel(
      storeId: 5,
      averageTimeText: "9 min 33 sec",
      worstTimeText: "209 min 19 sec",
    ),
    DeliveryTimeCardModel(
      storeId: 1,
      averageTimeText: "8 min 34 sec",
      worstTimeText: "15 min 59 sec",
    ),
    DeliveryTimeCardModel(
      storeId: 12,
      averageTimeText: "90 min 31 sec",
      worstTimeText: "110 min 55 sec",
    ),
    DeliveryTimeCardModel(
      storeId: 2,
      averageTimeText: "11 min 34 sec",
      worstTimeText: "20 min 20 sec",
    ),
    DeliveryTimeCardModel(
      storeId: 5,
      averageTimeText: "9 min 33 sec",
      worstTimeText: "209 min 19 sec",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.background,
      body: BlocProvider(
        create: (BuildContext context) =>
            HomeCubit(repository: getIt<IDeliveryTimeRepository>())..fetch(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) => RefreshIndicator(
            onRefresh: () async {
              context.read<HomeCubit>().fetch();
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Assets.images.home.logo.svg(height: 28.h),
                  ),
                  backgroundColor: AppColors.appbar,
                  elevation: 0,
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: HomePageHeaderDateButton(),
                ),
                SliverPadding(padding: EdgeInsets.only(bottom: 6.h)),
                state.map(
                  loading: (_) => const _Loading(),
                  failed: (_) => const _Failed(),
                  success: (success) => _Fetched(models: success.models), /// try with [dummyModels]
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return const DeliveryTimeCardShimmer();
      }, childCount: 5),
    );
  }
}

class _Fetched extends StatelessWidget {
  final List<DeliveryTimeCardModel> models;

  const _Fetched({required this.models, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (models.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text("No deliveries for this date", style: context.theme.textTheme.titleMedium),
        ),
      );
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return DeliveryTimeCard(
            model: models[index],
          );
        }, childCount: models.length),
      );
    }
  }
}

class _Failed extends StatelessWidget {
  const _Failed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Oops, something went wrong.\nPlease try again",
            textAlign: TextAlign.center,
            style: context.theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
