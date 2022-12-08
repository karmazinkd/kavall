import 'package:kavall/common/models/result.dart';
import 'package:kavall/home/data_sources/i_delivery_time_data_source.dart';
import 'package:kavall/home/models/dtos/delivery_time_record.dart';
import 'package:kavall/home/repositories/i_delivery_time_repository.dart';

class DefaultDeliveryTimeRepository extends IDeliveryTimeRepository {
  final IDeliveryTimeDataSource dataSource;

  DefaultDeliveryTimeRepository({required this.dataSource});

  @override
  Future<Result<List<DeliveryTimeRecord>>> fetchDeliveryTimeByDate(String date) async{
    return dataSource.fetchDeliveryTimeByDate(date);
  }
}
