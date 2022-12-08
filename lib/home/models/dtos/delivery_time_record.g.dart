// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_time_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryTimeResponse _$$_DeliveryTimeResponseFromJson(
        Map<String, dynamic> json) =>
    _$_DeliveryTimeResponse(
      orderId: json['orderId'] as int? ?? -1,
      storeId: json['storeId'] as int? ?? -1,
      date: json['date'] as String? ?? '',
      seconds: json['seconds'] as int? ?? 0,
    );

Map<String, dynamic> _$$_DeliveryTimeResponseToJson(
        _$_DeliveryTimeResponse instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'storeId': instance.storeId,
      'date': instance.date,
      'seconds': instance.seconds,
    };
