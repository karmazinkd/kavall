import 'package:kavall/common/models/result.dart';
import 'package:kavall/home/models/dtos/delivery_time_record.dart';

abstract class IDeliveryTimeRepository {
  Future<Result<List<DeliveryTimeRecord>>> fetchDeliveryTimeByDate(String date);
}