import 'package:flutter_test/flutter_test.dart';
import 'package:kavall/common/helpers/date_time_helper.dart';

void main() {
  group("convertDateTimeToString()", () {
    test("Method returns correct output format as follows yyyy-MM-dd", (){
      final input = DateTime(2022, 2, 16); // 2022 Feb 16
      const exp = "2022-02-16";
      expect(
          DateTimeHelper.convertDateTimeToString(input),
          exp
      );
    });
  });
}

