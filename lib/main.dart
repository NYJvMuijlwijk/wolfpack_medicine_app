import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wolfpack_medicine_app/data/AssetPaths.dart';
import 'package:wolfpack_medicine_app/data/MedicineDate.dart';
import 'package:wolfpack_medicine_app/data/MomentAPI.dart';
import 'package:wolfpack_medicine_app/frontend/daily_medicine_view.dart';
import 'package:wolfpack_medicine_app/frontend/weekly_medicine_view.dart';

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

  final List<MedicineDate> dates = MomentAPI.getMoments();

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        bottomNavigationBar: Material(
          color: Colors.grey[300],
          elevation: 10,
          child: TabBar(
            tabs: [
              Tab(icon: Image.asset(AssetPaths.pharmacy)),
              Tab(icon: Image.asset(AssetPaths.home)),
            ],
          ),
        ),
        body: Provider.value(
          value: dates,
          child: TabBarView(children: [
            DailyMedicineView(),
            WeeklyMedicineView(),
          ]),
        ),
      ),
    );
  }
}
