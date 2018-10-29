// UserInfoReducer.dart

import 'package:ly_app/Model/UserInfo.dart';
import 'package:redux/redux.dart'; // redux全局状态管理

/// redux 的 combineReducers, 通过 TypedReducer 将 UpdateUserInfoAction 与 reducers 关联起来
final UserInfoReducer = combineReducers<UserInfo>([
  TypedReducer<UserInfo, UpdateUserInfoAction>(_updateLoaded),
]);

/// 如果有 UpdateUserAction 发起一个请求时
/// 就会调用到 _updateLoaded
/// _updateLoaded 这里接受一个新的userInfo，并返回
UserInfo _updateLoaded(UserInfo userInfo, action) {
  userInfo = action.userInfo;
  return userInfo;
}

class UpdateUserInfoAction {
  final UserInfo userInfo;
  UpdateUserInfoAction(this.userInfo);
}

