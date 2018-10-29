// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeNewMessageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeNewMessageModel _$HomeNewMessageModelFromJson(Map<String, dynamic> json) {
  return HomeNewMessageModel(json['messageTitle'] as String,
      json['messageTypeName'] as String, json['messageType'] as int);
}

Map<String, dynamic> _$HomeNewMessageModelToJson(
        HomeNewMessageModel instance) =>
    <String, dynamic>{
      'messageTitle': instance.messageTitle,
      'messageTypeName': instance.messageTypeName,
      'messageType': instance.messageType
    };
