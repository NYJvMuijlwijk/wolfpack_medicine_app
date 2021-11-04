import 'package:wolfpack_medicine_app/data/MedicineDate.dart';

class MedicineWeek {
  final int weekNr;
  final List<MedicineDate> dates;
  
  MedicineWeek({
    required this.weekNr,
    required this.dates,
  });
}
