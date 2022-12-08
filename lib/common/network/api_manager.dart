import 'package:dio/dio.dart';
import 'package:kavall/common/constants/dart_define_values.dart';
import 'package:kavall/common/constants/network_constants.dart';

abstract class ApiManager {
  static Dio getDioClient() {
    final options = BaseOptions(
      connectTimeout: NetworkConstants.apiConnectTimeout,
      receiveTimeout: NetworkConstants.apiReceiveTimeout,
      sendTimeout: NetworkConstants.apiSendTimeout,
      contentType: Headers.formUrlEncodedContentType,
      baseUrl: DartDefineValues.baseUrl,
    );

    return Dio(options);
  }
}
