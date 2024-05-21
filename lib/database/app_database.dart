import 'dart:async';
import 'package:floor/floor.dart';
import 'package:name_origin/daos/history_dao.dart';
import 'package:name_origin/model/history.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [History])
abstract class AppDatabase extends FloorDatabase {
  HistoryDAO get historyDAO;
}