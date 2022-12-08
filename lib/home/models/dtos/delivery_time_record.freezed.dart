// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'delivery_time_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryTimeRecord _$DeliveryTimeRecordFromJson(Map<String, dynamic> json) {
  return _DeliveryTimeResponse.fromJson(json);
}

/// @nodoc
mixin _$DeliveryTimeRecord {
  int get orderId => throw _privateConstructorUsedError;
  int get storeId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  int get seconds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryTimeRecordCopyWith<DeliveryTimeRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryTimeRecordCopyWith<$Res> {
  factory $DeliveryTimeRecordCopyWith(
          DeliveryTimeRecord value, $Res Function(DeliveryTimeRecord) then) =
      _$DeliveryTimeRecordCopyWithImpl<$Res, DeliveryTimeRecord>;
  @useResult
  $Res call({int orderId, int storeId, String date, int seconds});
}

/// @nodoc
class _$DeliveryTimeRecordCopyWithImpl<$Res, $Val extends DeliveryTimeRecord>
    implements $DeliveryTimeRecordCopyWith<$Res> {
  _$DeliveryTimeRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? storeId = null,
    Object? date = null,
    Object? seconds = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeliveryTimeResponseCopyWith<$Res>
    implements $DeliveryTimeRecordCopyWith<$Res> {
  factory _$$_DeliveryTimeResponseCopyWith(_$_DeliveryTimeResponse value,
          $Res Function(_$_DeliveryTimeResponse) then) =
      __$$_DeliveryTimeResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int orderId, int storeId, String date, int seconds});
}

/// @nodoc
class __$$_DeliveryTimeResponseCopyWithImpl<$Res>
    extends _$DeliveryTimeRecordCopyWithImpl<$Res, _$_DeliveryTimeResponse>
    implements _$$_DeliveryTimeResponseCopyWith<$Res> {
  __$$_DeliveryTimeResponseCopyWithImpl(_$_DeliveryTimeResponse _value,
      $Res Function(_$_DeliveryTimeResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? storeId = null,
    Object? date = null,
    Object? seconds = null,
  }) {
    return _then(_$_DeliveryTimeResponse(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeliveryTimeResponse extends _DeliveryTimeResponse {
  const _$_DeliveryTimeResponse(
      {this.orderId = -1, this.storeId = -1, this.date = '', this.seconds = 0})
      : super._();

  factory _$_DeliveryTimeResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryTimeResponseFromJson(json);

  @override
  @JsonKey()
  final int orderId;
  @override
  @JsonKey()
  final int storeId;
  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final int seconds;

  @override
  String toString() {
    return 'DeliveryTimeRecord(orderId: $orderId, storeId: $storeId, date: $date, seconds: $seconds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryTimeResponse &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, storeId, date, seconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeliveryTimeResponseCopyWith<_$_DeliveryTimeResponse> get copyWith =>
      __$$_DeliveryTimeResponseCopyWithImpl<_$_DeliveryTimeResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryTimeResponseToJson(
      this,
    );
  }
}

abstract class _DeliveryTimeResponse extends DeliveryTimeRecord {
  const factory _DeliveryTimeResponse(
      {final int orderId,
      final int storeId,
      final String date,
      final int seconds}) = _$_DeliveryTimeResponse;
  const _DeliveryTimeResponse._() : super._();

  factory _DeliveryTimeResponse.fromJson(Map<String, dynamic> json) =
      _$_DeliveryTimeResponse.fromJson;

  @override
  int get orderId;
  @override
  int get storeId;
  @override
  String get date;
  @override
  int get seconds;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryTimeResponseCopyWith<_$_DeliveryTimeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
