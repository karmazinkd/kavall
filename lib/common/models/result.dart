import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success({required T data}) = ResultSuccess<T>;

  const factory Result.failed({
    required String message,
    required Exception exception,
    StackTrace? stackTrace,
  }) = ResultFailure<T>;
}
