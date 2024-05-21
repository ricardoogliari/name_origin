import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:name_origin/controller/history_controller.dart';
import 'package:name_origin/controller/name_controller.dart';
import 'package:name_origin/pages/histories_page.dart';
import 'package:name_origin/pages/home_page.dart';

void main() {
  Get.put(NameController());
  Get.put(HistoryController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/history': (context) => HistoriesPage()
      },
    );
  }
}