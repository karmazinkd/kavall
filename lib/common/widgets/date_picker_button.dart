import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kavall/common/helpers/date_time_helper.dart';

class DatePickerButton extends StatefulWidget {
  final Function(DateTime selectedDate) onDateSelected;
  final DateTime initialDate;

  const DatePickerButton({required this.onDateSelected, required this.initialDate, Key? key})
      : super(key: key);

  @override
  State<DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 6.h,
        ),
      ),
      onPressed: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          widget.onDateSelected(pickedDate);
          setState(() {
            selectedDate = pickedDate;
          });
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(DateTimeHelper.convertDateTimeToString(selectedDate)),
          SizedBox(width: 5.w),
          const Icon(Icons.keyboard_arrow_down_rounded),
        ],
      ),
    );
  }
}
