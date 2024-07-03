
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:task_ease/core/styles/colors.dart';

class DatePickerHorizontal extends StatelessWidget {
  const DatePickerHorizontal({super.key, required this.dateTime, this.onDateChange,});

  final DateTime dateTime;
  final void Function(DateTime)? onDateChange;
  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: dateTime,
      onDateChange: onDateChange,
      dayProps: const EasyDayProps(
        height: 56.0,
        // You must specify the width in this case.
        width: 124.0,
      ),
      headerProps: const EasyHeaderProps(
        dateFormatter: DateFormatter.fullDateMonthAsStrDY(),
      ),
      itemBuilder: (context, date, isSelected, onTap) {
        return InkWell(
          // You can use `InkResponse` to make your widget clickable.
          // The `onTap` callback responsible for triggering the `onDateChange`
          // callback.
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            //the same width that provided previously.
            width: 124.0,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: isSelected ? ColorsManager.kPrimaryColor : ColorsManager.kPrimaryLightColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  EasyDateFormatter.shortMonthName(date, "en_US"),
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.white : const Color(0xff6D5D6E),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  date.day.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : const Color(0xff393646),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  EasyDateFormatter.shortDayName(date, "en_US"),
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.white : const Color(0xff6D5D6E),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
// EasyDateTimeLine(
// initialDate: DateTime.now(),
// onDateChange: onDateChange,
// headerProps:  EasyHeaderProps(
// monthPickerType: MonthPickerType.switcher,
// dateFormatter: const DateFormatter.fullDateDMY(),
// selectedDateStyle: TextStyles.font18SemiBold,
// monthStyle: TextStyles.font18SemiBold,
// ),
// dayProps:  EasyDayProps(
// dayStructure: DayStructure.dayStrDayNumMonth,
// inactiveDayStyle: DayStyle(
// monthStrStyle: TextStyles.font13Regular,
// dayStrStyle: TextStyles.font13Regular,
// decoration: BoxDecoration(
// borderRadius: const BorderRadius.all(Radius.circular(8)),
// gradient: LinearGradient(
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// colors: [
// const Color(0xff8426D6).withOpacity(0.25),
// const Color(0xff8426D6).withOpacity(0.15),
// const Color(0xff8426D6).withOpacity(0.1),
// const Color(0xff8426D6).withOpacity(0.1),
// const Color(0xff8426D6).withOpacity(0.1),
// const Color(0xff8426D6).withOpacity(0.1),
// const Color(0xff8426D6).withOpacity(0.1),
// const Color(0xff8426D6).withOpacity(0.1),
// const Color(0xff8426D6).withOpacity(0.15),
// const Color(0xff8426D6).withOpacity(0.25),
//
// ],
// ),
// ),
// ),
// activeDayStyle: const DayStyle(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.all(Radius.circular(8)),
// gradient: LinearGradient(
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// colors: [
// Color(0xff3371FF),
// Color(0xff8426D6),
// ],
// ),
// ),
// ),
// ),
// )