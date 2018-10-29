
// YYRedux.dart

import 'package:ly_app/Model/UserInfo.dart'; // UserInfo类
import 'package:ly_app/Redux/UserInfoRedux.dart'; //UserInfoRedux类

// 需要全局的对象在YYState类里面添加
class YYState {
  UserInfo userInfo;

  YYState({this.userInfo});
}

// 创建store使用
YYState appReducer(YYState state, action) {
  return YYState(
    // 将全局对象和action关联
    userInfo: UserInfoReducer(state.userInfo, action),
  );
}