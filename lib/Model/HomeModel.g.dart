// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return HomeModel(
      json['name'] as String, json['age'] as int, json['push_id'] as int);
}

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'push_id': instance.pushId
    };
