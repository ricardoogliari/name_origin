import 'package:json_annotation/json_annotation.dart';
import 'package:name_origin/model/country.dart';

part 'name_origin.g.dart';

@JsonSerializable()
class NameOrigin {
  //country_id
  final List<Country>? country;

  NameOrigin(this.country);

  factory NameOrigin.fromJson(Map<String, dynamic> json) => _$NameOriginFromJson(json);

  Map<String, dynamic> toJson() => _$NameOriginToJson(this);
}