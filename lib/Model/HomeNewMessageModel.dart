import 'package:json_annotation/json_annotation.dart';

part 'HomeNewMessageModel.g.dart';

@JsonSerializable()

class HomeNewMessageModel extends Object {
  String messageTitle;
  String messageTypeName;
  int messageType;

  HomeNewMessageModel(this.messageTitle, this.messageTypeName, this.messageType);

  factory HomeNewMessageModel.fromJson(Map<String, dynamic> json) => _$HomeNewMessageModelFromJson(json);
}
