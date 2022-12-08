import 'package:equatable/equatable.dart';

class DeliveryTimeCardModel extends Equatable{
  final int storeId;
  final String averageTimeText;
  final String worstTimeText;

  const DeliveryTimeCardModel({
    required this.storeId,
    required this.averageTimeText,
    required this.worstTimeText,
  });

  @override
  List<Object> get props => [storeId, averageTimeText, worstTimeText];
}
