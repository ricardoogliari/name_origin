import 'package:floor/floor.dart';
import 'package:name_origin/model/history.dart';

@dao
abstract class HistoryDAO {

  @Query('SELECT * FROM History')
  Future<List<History>> findAllHistories();

  @insert
  Future<void> insertHistory(History history);

  @Query('DELETE FROM History')
  Future<void> clearHistories();

}