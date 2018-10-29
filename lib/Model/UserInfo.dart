import 'package:json_annotation/json_annotation.dart';

part 'UserInfo.g.dart';

@JsonSerializable()

class UserInfo extends Object {
  String name = "";
  String id;
  String companyInfo;
  int customerNum;
  String description;
  String employeeId;
  String mobile;
  String orgName;
  String positionName;
  String qualification;
  int qualifiedInvestAuth;
  String qualifiedInvestAuthName;
  String userHeadIcon;
  String userName;
  String advisorName = "";
  int workExperience;


  UserInfo(
      this.name,
      this.id,
      this.companyInfo,
      this.customerNum,
      this.description,
      this.employeeId,
      this.mobile,
      this.orgName,
      this.positionName,
      this.qualification,
      this.qualifiedInvestAuth,
      this.qualifiedInvestAuthName,
      this.userHeadIcon,
      this.userName,
      this.advisorName,
      this.workExperience,
      );


  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  UserInfo.empty();
}



