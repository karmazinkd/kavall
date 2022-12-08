import 'package:dio/dio.dart';
import 'package:kavall/home/models/dtos/delivery_time_record.dart';
import 'package:retrofit/retrofit.dart';

part 'delivery_time_api.g.dart';

@RestApi()
abstract class DeliveryTimeApi {
  factory DeliveryTimeApi(Dio client) = _DeliveryTimeApi;

  @GET('/hometestDeliveries')
  Future<List<DeliveryTimeRecord>> fetchDeliveryTimeByDate(@Query("date") String date);
}