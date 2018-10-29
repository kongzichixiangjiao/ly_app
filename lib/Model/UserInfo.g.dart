// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(
      json['name'] as String,
      json['id'] as String,
      json['companyInfo'] as String,
      json['customerNum'] as int,
      json['description'] as String,
      json['employeeId'] as String,
      json['mobile'] as String,
      json['orgName'] as String,
      json['positionName'] as String,
      json['qualification'] as String,
      json['qualifiedInvestAuth'] as int,
      json['qualifiedInvestAuthName'] as String,
      json['userHeadIcon'] as String,
      json['userName'] as String,
      json['advisorName'] as String,
      json['workExperience'] as int);
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'companyInfo': instance.companyInfo,
      'customerNum': instance.customerNum,
      'description': instance.description,
      'employeeId': instance.employeeId,
      'mobile': instance.mobile,
      'orgName': instance.orgName,
      'positionName': instance.positionName,
      'qualification': instance.qualification,
      'qualifiedInvestAuth': instance.qualifiedInvestAuth,
      'qualifiedInvestAuthName': instance.qualifiedInvestAuthName,
      'userHeadIcon': instance.userHeadIcon,
      'userName': instance.userName,
      'advisorName': instance.advisorName,
      'workExperience': instance.workExperience
    };
