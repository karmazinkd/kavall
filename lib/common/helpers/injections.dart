import 'package:get_it/get_it.dart';
import 'package:kavall/common/network/api_manager.dart';
import 'package:kavall/home/data_sources/delivery_time_api.dart';
import 'package:kavall/home/data_sources/delivery_time_remote_data_source.dart';
import 'package:kavall/home/data_sources/i_delivery_time_data_source.dart';
import 'package:kavall/home/repositories/default_delivery_time_repository.dart';
import 'package:kavall/home/repositories/i_delivery_time_repository.dart';

final GetIt getIt = GetIt.instance;

setUpInjections() {
  final dioClient = ApiManager.getDioClient();
  getIt.registerSingleton<IDeliveryTimeDataSource>(
    DeliveryTimeRemoteDataSource(api: DeliveryTimeApi(dioClient)),
  );

  getIt.registerSingleton<IDeliveryTimeRepository>(
    DefaultDeliveryTimeRepository(dataSource: getIt<IDeliveryTimeDataSource>()),
  );
}
