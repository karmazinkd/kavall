import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavall/common/helpers/date_time_helper.dart';
import 'package:kavall/common/models/result.dart';
import 'package:kavall/home/cubits/home_cubit.dart';
import 'package:kavall/home/cubits/home_state.dart';
import 'package:kavall/home/models/delivery_time_card_model.dart';
import 'package:kavall/home/models/dtos/delivery_time_record.dart';
import 'package:kavall/home/repositories/i_delivery_time_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockIDeliveryTimeRepository extends Mock implements IDeliveryTimeRepository {}

void main() {
  group('HomeCubit', () {
    const List<DeliveryTimeRecord> fetchedRecords = [
      DeliveryTimeRecord(storeId: 2, date: "2022-05-18", orderId: 2, seconds: 700),
      DeliveryTimeRecord(storeId: 3, date: "2022-05-18", orderId: 55, seconds: 500),
      DeliveryTimeRecord(storeId: 3, date: "2022-05-18", orderId: 56, seconds: 600),
      DeliveryTimeRecord(storeId: 1, date: "2022-05-18", orderId: 12, seconds: 300),
      DeliveryTimeRecord(storeId: 1, date: "2022-05-18", orderId: 13, seconds: 100),
    ];

    const List<DeliveryTimeCardModel> processedModels = [
      DeliveryTimeCardModel(
        storeId: 1,
        averageTimeText: '3 min 20 sec',
        worstTimeText: '5 min 0 sec',
      ),
      DeliveryTimeCardModel(
        storeId: 2,
        averageTimeText: '11 min 40 sec',
        worstTimeText: '11 min 40 sec',
      ),
      DeliveryTimeCardModel(
        storeId: 3,
        averageTimeText: '9 min 10 sec',
        worstTimeText: '10 min 0 sec',
      ),
    ];

    const String errorMsg = "Error msg";

    late IDeliveryTimeRepository mockRepository;
    late HomeCubit cubit;
    late DateTime now;
    late String nowDateText;
    late DateTime prevDate;
    late String prevDateText;

    setUp(() {
      mockRepository = MockIDeliveryTimeRepository();
      cubit = HomeCubit(repository: mockRepository);
      now = DateTime.now();
      nowDateText = DateTimeHelper.convertDateTimeToString(now);
      prevDate = now.subtract(const Duration(days: 2));
      prevDateText = DateTimeHelper.convertDateTimeToString(prevDate);
    });

    tearDown(() {
      cubit.close();
    });

    test('initial state is HomeState.loading()', () {
      expect(cubit.state.runtimeType, const HomeState.loading().runtimeType);
    });

    test("initial value of selectedDate is today's date", () {
      now = DateTime.now();
      expect(cubit.getSelectedDate().year, now.year);
      expect(cubit.getSelectedDate().month, now.month);
      expect(cubit.getSelectedDate().day, now.day);
    });

    blocTest<HomeCubit, HomeState>(
      'Successful fetch(): '
      'repository.fetchDeliveryTimeByDate() is called with today\'s date, '
      'states order: HomeState.loading(), HomeState.fetched(), '
      'emitted Fetched state contains correct list of processed records',
      build: () => cubit,
      act: (cubit) async {
        when(() => mockRepository.fetchDeliveryTimeByDate(nowDateText)).thenAnswer(
          (invocation) =>
              Future.value(const Result<List<DeliveryTimeRecord>>.success(data: fetchedRecords)),
        );

        await cubit.fetch();
      },
      expect: () => [const HomeState.loading(), const HomeState.success(models: processedModels)],
      verify: (cubit) {
        verify(() => mockRepository.fetchDeliveryTimeByDate(nowDateText)).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'Failed fetch(): '
      'repository.fetchDeliveryTimeByDate() is called with today\'s date, '
      'states: HomeState.loading(), HomeState.failed(),'
      'emitted Failed states contains the error message',
      build: () => cubit,
      act: (cubit) async {
        when(() => mockRepository.fetchDeliveryTimeByDate(nowDateText)).thenAnswer(
          (invocation) => Future.value(Result<List<DeliveryTimeRecord>>.failed(
            message: errorMsg,
            exception: Exception(errorMsg),
          )),
        );

        await cubit.fetch();
      },
      expect: () => [const HomeState.loading(), const HomeState.failed(message: errorMsg)],
      verify: (cubit) {
        verify(() => mockRepository.fetchDeliveryTimeByDate(nowDateText)).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'onDatePicked updates selectedDate and starts fetching with this date: '
      'repository.fetchDeliveryTimeByDate() is called with a new date, '
      'states: HomeState.loading(), HomeState.fetched(),'
      'emitted Fetched state contains correct list of processed records'
      'selectedDate was updated in the cubit',
      build: () => cubit,
      act: (cubit) async {
        when(() => mockRepository.fetchDeliveryTimeByDate(prevDateText)).thenAnswer(
          (invocation) =>
              Future.value(const Result<List<DeliveryTimeRecord>>.success(data: fetchedRecords)),
        );

        await cubit.onDatePicked(prevDate);
      },
      expect: () => [const HomeState.loading(), const HomeState.success(models: processedModels)],
      verify: (cubit) {
        expect(cubit.getSelectedDate(), prevDate);
      },
    );
  });
}
