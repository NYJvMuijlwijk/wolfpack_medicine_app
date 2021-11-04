import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wolfpack_medicine_app/data/AssetPaths.dart';
import 'package:wolfpack_medicine_app/data/Medicine.dart';
import 'package:wolfpack_medicine_app/data/MedicineDate.dart';
import 'package:wolfpack_medicine_app/data/Moment.dart';
import 'package:wolfpack_medicine_app/data/MomentAPI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<MedicineDate> moments = MomentAPI.getMoments();
  final DateFormat dayFormat = new DateFormat("EEEE d MMMM");

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (MedicineDate date in moments) ...[
            Text(
              dayFormat.format(date.date),
              style: Theme.of(context).textTheme.headline4,
            ),
            for (Moment moment in date.moments) _MomentItem(moment: moment),
          ]
        ],
      ),
    );
  }
}

class _MomentItem extends StatefulWidget {
  final Moment moment;

  const _MomentItem({
    required this.moment,
    Key? key,
  }) : super(key: key);

  @override
  State<_MomentItem> createState() => _MomentItemState();
}

class _MomentItemState extends State<_MomentItem> {
  final DateFormat timeFormat = new DateFormat.Hm();
  late Moment moment;

  @override
  void initState() {
    super.initState();

    moment = widget.moment;
  }

  void ToggleAllMedicineTaken() {
    final allTaken = moment.medicines.every((m) => m.taken);
    for (Medicine medicine in moment.medicines) medicine.taken = !allTaken;
    setState(() {});
  }

  void ToggleMedicineTaken(Medicine medicine) {
    medicine.taken = !medicine.taken;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(moment.title),
      subtitle: Text(timeFormat.format(moment.date)),
      leading: Image.asset(moment.iconPath),
      trailing: InkWell(
        onTap: ToggleAllMedicineTaken,
        child: Image.asset(moment.medicines.every((element) => element.taken) ? AssetPaths.checkbox_white : AssetPaths.checkbox_empty),
      ),
      children: moment.medicines
          .map((m) => InkWell(
                onTap: () => ToggleMedicineTaken(m),
                child: ListTile(
                  title: Text(m.name),
                  subtitle: Text("Medicijn hoeveelheid"),
                  trailing: Image.asset(m.taken ? AssetPaths.checkbox_green : AssetPaths.checkbox_empty),
                ),
              ))
          .toList(),
    );
  }
}
