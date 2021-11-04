import 'package:wolfpack_medicine_app/data/Medicine.dart';

class Moment {
  final String title;
  final String iconPath;
  final List<Medicine> medicines;
  final DateTime date;
  bool isCollapsed;

  Moment({
    required this.title,
    required this.iconPath,
    required this.medicines,
    required this.date,
    this.isCollapsed = true,
  });
}
