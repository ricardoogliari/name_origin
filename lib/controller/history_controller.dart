import 'package:get/get.dart';
import 'package:name_origin/daos/history_dao.dart';
import 'package:name_origin/database/app_database.dart';
import 'package:name_origin/model/history.dart';

class HistoryController extends GetxController with StateMixin<List<History>>{

  late AppDatabase database;
  late HistoryDAO historyDao;

  HistoryController(){
    change(null, status: RxStatus.empty());
    _openDatabase();
  }

  void _openDatabase() async {
    database = await $FloorAppDatabase.databaseBuilder('history.db').build();
    historyDao = database.historyDAO;
  }

  void listHistories() async {
    change(null, status: RxStatus.loading());
    List<History> histories = await historyDao.findAllHistories();
    change(histories, status: RxStatus.success());
  }

  void insertHistory(History history){
    historyDao.insertHistory(history);
  }

  void clearHistories(){
    change(null, status: RxStatus.loading());
    historyDao.clearHistories();
    change([], status: RxStatus.success());
  }

}