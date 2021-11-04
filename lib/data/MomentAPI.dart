import 'package:wolfpack_medicine_app/data/AssetPaths.dart';
import 'package:wolfpack_medicine_app/data/Medicine.dart';
import 'package:wolfpack_medicine_app/data/MedicineDate.dart';
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

  static List<MedicineDate>? _moments = null;

  static List<MedicineDate> getMoments() {
    if (_moments == null) {
      _moments = [
        MedicineDate(
          moments: [
            _Breakfast(1),
            _Lunch(1),
          ],
          date: DateTime(2021, 11, 1, 22),
        ),
        MedicineDate(
          moments: [
            _Breakfast(2),
            _Lunch(2),
            _AtWork(2),
          ],
          date: DateTime(2021, 11, 2, 22),
        ),
        MedicineDate(
          moments: [
            _Breakfast(3),
            _Lunch(3),
          ],
          date: DateTime(2021, 11, 3, 22),
        ),
        MedicineDate(
          moments: [
            _Breakfast(4),
            _AtWork(4),
          ],
          date: DateTime(2021, 11, 4, 22),
        ),
        MedicineDate(
          moments: [
            _Breakfast(6),
            _Lunch(6),
            _AtWork(6),
          ],
          date: DateTime(2021, 11, 6, 22),
        ),
        MedicineDate(
          moments: [
            _BedTime(7),
          ],
          date: DateTime(2021, 11, 7, 22),
        ),
        MedicineDate(
          moments: [
            _Breakfast(8),
            _Lunch(8),
          ],
          date: DateTime(2021, 11, 8, 22),
        ),
        MedicineDate(
          moments: [
            _Breakfast(9),
            _Lunch(9),
            _AtWork(9),
          ],
          date: DateTime(2021, 11, 9, 22),
        ),
        MedicineDate(
          moments: [
            _Breakfast(10),
            _Lunch(10),
          ],
          date: DateTime(2021, 11, 10),
        ),
        MedicineDate(
          moments: [
            _Breakfast(11),
            _AtWork(11),
          ],
          date: DateTime(2021, 11, 11),
        ),
        MedicineDate(
          moments: [
            _Breakfast(13),
            _Lunch(13),
            _AtWork(13),
          ],
          date: DateTime(2021, 11, 13),
        ),
        MedicineDate(
          moments: [
            _BedTime(14),
          ],
          date: DateTime(2021, 11, 14),
        ),
      ];
    }
    return _moments!;
  }
}
