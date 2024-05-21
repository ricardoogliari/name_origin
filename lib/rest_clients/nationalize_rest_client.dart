import 'package:dio/dio.dart';
import 'package:name_origin/model/name_origin.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nationalize_rest_client.g.dart';

@RestApi(baseUrl: 'https://api.nationalize.io/')
abstract class NationalizeRestClient {
  factory NationalizeRestClient(Dio dio, {String baseUrl}) = _NationalizeRestClient;

  @GET("")
  Future<NameOrigin> getOriginName(@Query('name') String name);

}
/*
@JsonSerializable()
class Task {
  const Task({this.id, this.name, this.avatar, this.createdAt});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  final String? id;
  final String? name;
  final String? avatar;
  final String? createdAt;

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}*/