import 'package:get/get.dart';
import 'package:name_origin/model/name_origin.dart';
import 'package:name_origin/rest_clients/nationalize_rest_client.dart';
import 'package:dio/dio.dart';

class NameController extends GetxController with StateMixin<NameOrigin>{

  Dio dio = Dio();
  late NationalizeRestClient nationalizedClient = NationalizeRestClient(dio);

  NameController(){
    change(null, status: RxStatus.empty());
    nationalizedClient = NationalizeRestClient(dio);
  }

  void searchOrigin(String name){
    change(null, status: RxStatus.loading());
    nationalizedClient.getOriginName(name).then(
      (it) {
        change(it, status: RxStatus.success());
      }
    ).onError((error, stackTrace) {
        RxStatus.error(error.toString());
      }
    ).catchError((obj) {
      switch (obj.runtimeType) {
        case DioException _:
          final res = (obj as DioException).response;
          RxStatus.error('Got error : ${res?.statusCode} -> ${res?.statusMessage}');
          break;
        default:
          RxStatus.error('Got error : default');
          break;
      }
    });
  }

}