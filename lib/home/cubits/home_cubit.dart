import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kavall/common/helpers/date_time_helper.dart';
import 'package:kavall/common/helpers/extensions.dart';
import 'package:kavall/home/cubits/home_state.dart';
import 'package:kavall/home/models/delivery_time_card_model.dart';
import 'package:kavall/home/models/dtos/delivery_time_record.dart';
import 'package:kavall/home/repositories/i_delivery_time_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final IDeliveryTimeRepository _repository;
  DateTime _selectedDate = DateTime.now();

  HomeCubit({required IDeliveryTimeRepository repository})
      : _repository = repository,
        super(const HomeState.loading());

  DateTime getSelectedDate() => _selectedDate;

  Future<void> fetch() async {
    emit(const HomeState.loading());
    final res = await _repository.fetchDeliveryTimeByDate(
      DateTimeHelper.convertDateTimeToString(_selectedDate),
    );

    final state = res.map(success: (records) {
      return HomeState.success(models: _calculateAverageDeliveryTime(records.data));
    }, failed: (failure) {
      return HomeState.failed(message: failure.message);
    });

    emit(state);
  }

  Future<void> onDatePicked(DateTime pickedDateTime) async{
    _selectedDate = pickedDateTime;
    return fetch();
  }

  List<DeliveryTimeCardModel> _calculateAverageDeliveryTime(List<DeliveryTimeRecord> records) {
    final Map<int, List<DeliveryTimeRecord>> group =
        records.groupBy<int>((record) => record.storeId);
    final models = <DeliveryTimeCardModel>[];

    for (final groupedEntries in group.entries) {
      int deliverySumSeconds = 0;
      int worstDeliverySeconds = groupedEntries.value[0].seconds;
      for (DeliveryTimeRecord record in groupedEntries.value) {
        deliverySumSeconds += record.seconds;
        if (record.seconds > worstDeliverySeconds) {
          worstDeliverySeconds = record.seconds;
        }
      }
      int averageDeliveryTimeSeconds = deliverySumSeconds ~/ groupedEntries.value.length;
      final averageDeliveryText =
          '${averageDeliveryTimeSeconds ~/ 60} min ${averageDeliveryTimeSeconds % 60} sec';
      final worstDeliveryText =
          '${worstDeliverySeconds ~/ 60} min ${worstDeliverySeconds % 60} sec';

      models.add(
        DeliveryTimeCardModel(
          storeId: groupedEntries.key,
          averageTimeText: averageDeliveryText,
          worstTimeText: worstDeliveryText,
        ),
      );
    }
    models.sort((a, b) => a.storeId.compareTo(b.storeId));
    return models;
  }
}
