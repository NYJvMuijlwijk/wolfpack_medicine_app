import 'dart:math';

import 'package:wolfpack_medicine_app/data/AssetPaths.dart';
import 'package:wolfpack_medicine_app/data/Medicine.dart';
import 'package:wolfpack_medicine_app/data/Moment.dart';

class MomentAPI {
  static Moment _Breakfast(int day) {
    return Moment(
      title: "Ontbijt",
      date: DateTime(2021, 11, day, 8),
      iconPath: AssetPaths.breakfast,
      medicines: [Medicine(name: "Paracetamol"), Medicine(name: "Vitatmine C")],
    );
  }

  static Moment _Lunch(int day) {
    return Moment(
      title: "Lunch",
      date: DateTime(2021, 11, day, 12),
      iconPath: AssetPaths.home,
      medicines: [Medicine(name: "Acebutol")],
    );
  }

  static Moment _AtWork(int day) {
    return Moment(
      title: "Op 't werk",
      date: DateTime(2021, 11, day, 15),
      iconPath: AssetPaths.business,
      medicines: [Medicine(name: "Paracetamol")],
    );
  }

  static Moment _BedTime(int day) {
    return Moment(
      title: "Voor het slapen",
      date: DateTime(2021, 11, day, 22),
      iconPath: AssetPaths.alarm,
      medicines: [Medicine(name: "Melatonin")],
    );
  }

  static List<Moment>? _moments = null;

  static List<Moment> getMoments() {
    if (_moments == null) {
      _moments = [
        _Breakfast(1),
        _Lunch(1),
        _Breakfast(2),
        _Lunch(2),
        _AtWork(2),
        _Breakfast(3),
        _Lunch(3),
        _Breakfast(4),
        _AtWork(4),
        _Breakfast(6),
        _Lunch(6),
        _AtWork(6),
        _BedTime(7),
        _Breakfast(8),
        _Lunch(8),
        _Breakfast(9),
        _Lunch(9),
        _AtWork(9),
        _Breakfast(10),
        _Lunch(10),
        _Breakfast(11),
        _AtWork(11),
        _Breakfast(13),
        _Lunch(13),
        _AtWork(13),
        _BedTime(14),
      ];

      _moments![Random().nextInt(_moments!.length)].isCollapsed = false;
    }
    return _moments!;
  }
}
