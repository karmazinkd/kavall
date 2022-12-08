import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kavall/home/models/delivery_time_card_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;

  const factory HomeState.failed({
    String? message,
  }) = _Failure;

  const factory HomeState.success({
    required List<DeliveryTimeCardModel> models,
  }) = _Success;
}
