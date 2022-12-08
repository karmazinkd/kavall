import 'package:kavall/common/helpers/extensions.dart';
import 'package:kavall/common/models/result.dart';
import 'package:kavall/home/data_sources/delivery_time_api.dart';
import 'package:kavall/home/data_sources/i_delivery_time_data_source.dart';
import 'package:kavall/home/models/dtos/delivery_time_record.dart';

class DeliveryTimeRemoteDataSource implements IDeliveryTimeDataSource {
  final DeliveryTimeApi api;

  DeliveryTimeRemoteDataSource({required this.api});

  @override
  Future<Result<List<DeliveryTimeRecord>>> fetchDeliveryTimeByDate(String date) async{
    return api.fetchDeliveryTimeByDate(date).toResult();
  }
}
