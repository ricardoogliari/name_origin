import 'package:floor/floor.dart';

@entity
class History {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final int timestamp;

  History({this.id, required this.name, required this.timestamp});
}