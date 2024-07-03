
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/text_styles.dart';

class DatePickerHorizontal extends StatelessWidget {
  const DatePickerHorizontal({super.key, required this.dateTime, this.onDateChange,});

  final DateTime dateTime;
  final void Function(DateTime)? onDateChange;
  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
        initialDate: DateTime.now(),
    onDateChange: onDateChange,
    headerProps:  EasyHeaderProps(
    monthPickerType: MonthPickerType.switcher,
    dateFormatter: const DateFormatter.fullDateDMY(),
    selectedDateStyle: TextStyles.font18SemiBold,
    monthStyle: TextStyles.font18SemiBold,
    ),
    dayProps:  EasyDayProps(
    dayStructure: DayStructure.dayStrDayNumMonth,
    inactiveDayStyle: DayStyle(
    monthStrStyle: TextStyles.font13Regular,
    dayStrStyle: TextStyles.font13Regular,
    decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
    const Color(0xff8426D6).withOpacity(0.25),
    const Color(0xff8426D6).withOpacity(0.15),
    const Color(0xff8426D6).withOpacity(0.1),
    const Color(0xff8426D6).withOpacity(0.1),
    const Color(0xff8426D6).withOpacity(0.1),
    const Color(0xff8426D6).withOpacity(0.1),
    const Color(0xff8426D6).withOpacity(0.1),
    const Color(0xff8426D6).withOpacity(0.1),
    const Color(0xff8426D6).withOpacity(0.15),
    const Color(0xff8426D6).withOpacity(0.25),

    ],
    ),
    ),
    ),
      activeDayStyle: const DayStyle(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff3371FF),
              Color(0xff8426D6),
            ],
          ),
        ),
      ),
    ),
    );
  }
}

