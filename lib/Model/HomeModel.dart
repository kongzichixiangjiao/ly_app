import 'package:json_annotation/json_annotation.dart';

part 'HomeModel.g.dart';

///标志class需要实现json序列化功能
@JsonSerializable()

class HomeModel extends Object {

  String name;

  int age;

  ///通过JsonKey重新定义参数名
  @JsonKey(name: "push_id")
  int pushId;

  HomeModel(this.name, this.age, this.pushId);

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);
}

