import 'package:wolfpack_medicine_app/data/Moment.dart';

class MedicineDate {
  final DateTime date;
  final List<Moment> moments;
  
  MedicineDate({
    required this.date,
    required this.moments,
  });
}
