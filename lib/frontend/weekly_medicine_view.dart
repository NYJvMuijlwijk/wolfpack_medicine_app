import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';
import 'package:wolfpack_medicine_app/data/AssetPaths.dart';
import 'package:wolfpack_medicine_app/data/MedicineDate.dart';
import 'package:wolfpack_medicine_app/data/MedicineWeek.dart';
import 'package:wolfpack_medicine_app/data/Moment.dart';

class WeeklyMedicineView extends StatelessWidget {
  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  int numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  int weekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = numOfWeeks(date.year - 1);
    } else if (woy > numOfWeeks(date.year)) {
      woy = 1;
    }
    return woy;
  }

  List<MedicineWeek> datesToWeeks(List<MedicineDate> dates) {
    dates.sort((a, b) => a.date.compareTo(b.date));
    final lowestWeek = weekNumber(dates.first.date);
    final lastWeek = weekNumber(dates.last.date);
    final List<MedicineWeek> weeks = [];

    for (var i = lowestWeek; i <= lastWeek; i++) {
      final List<MedicineDate> mDates = [];

      for (MedicineDate date in dates) {
        final weekNr = weekNumber(date.date);
        if (weekNr == i)
          mDates.add(date);
        else if (weekNr > i) break;
      }

      weeks.add(MedicineWeek(weekNr: i, dates: mDates));
    }
    return weeks;
  }

  @override
  Widget build(BuildContext context) {
    final dates = context.watch<List<MedicineDate>>();
    final weeks = datesToWeeks(dates);

    return ListView(
      children: [
        for (MedicineWeek week in weeks) _WeekItem(week: week),
      ],
    );
  }
}

class _WeekItem extends StatelessWidget {
  const _WeekItem({
    Key? key,
    required this.week,
  }) : super(key: key);

  final MedicineWeek week;

  int totalMedicineCountOfWeek(MedicineWeek week) {
    int totalMedicine = 0;

    for (MedicineDate date in week.dates) {
      for (Moment moment in date.moments) {
        totalMedicine += moment.medicines.length;
      }
    }

    return totalMedicine;
  }

  int medicineOfWeekComplete(MedicineWeek week) {
    int medicineComplete = 0;

    for (MedicineDate date in week.dates) {
      for (Moment moment in date.moments) {
        medicineComplete += moment.medicines.where((m) => m.taken).length;
      }
    }

    return medicineComplete;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("Week ${week.weekNr}"),
      trailing: Image.asset(
        week.dates.every((md) => md.moments.every((moment) => moment.medicines.every((medicine) => medicine.taken)))
            ? AssetPaths.checkbox_white
            : AssetPaths.checkbox_empty,
      ),
      children: [
        ListTile(
          title: Text("Dagen Compleet"),
          subtitle: Text(
            "${week.dates.where((mDate) => mDate.moments.every((moment) => moment.medicines.every((medicine) => medicine.taken))).length} / ${week.dates.length}",
          ),
        ),
        ListTile(
          title: Text("Medicijnen Compleet"),
          subtitle: Text(
            "${medicineOfWeekComplete(week)} / ${totalMedicineCountOfWeek(week)}",
          ),
        ),
      ],
    );
  }
}
