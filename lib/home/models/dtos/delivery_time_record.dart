import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_time_record.freezed.dart';
part 'delivery_time_record.g.dart';

@freezed
class DeliveryTimeRecord with _$DeliveryTimeRecord {
  const factory DeliveryTimeRecord({
    @Default(-1) int orderId,
    @Default(-1) int storeId,
    @Default('') String date,
    @Default(0) int seconds,
  }) = _DeliveryTimeResponse;

  const DeliveryTimeRecord._();


  factory DeliveryTimeRecord.fromJson(Map<String, dynamic> json) => _$DeliveryTimeRecordFromJson(json);
}