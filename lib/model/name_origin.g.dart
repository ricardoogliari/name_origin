// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_origin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NameOrigin _$NameOriginFromJson(Map<String, dynamic> json) => NameOrigin(
      (json['country'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NameOriginToJson(NameOrigin instance) =>
    <String, dynamic>{
      'country': instance.country,
    };
