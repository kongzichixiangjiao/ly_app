import 'YYRequestManager.dart';
import 'YYResultModel.dart';

import 'PXResultModel.dart';
import 'PXAdress.dart';

import 'package:ly_app/Model/UserInfo.dart';
import 'package:ly_app/Model/HomeNewMessageModel.dart';

class PXRequest {

  static px_getuser() async {
    YYResultModel model = await YYRequestManager.requestPost(PXAdress.getuser(), null);

    PXResultModel px_model = PXResultModel.init(model.data);

    UserInfo userInfo = UserInfo.fromJson(px_model.result);

    return userInfo;
  }

  static px_homeNewMessage() async {
    String url = PXAdress.getHomeNewMessage();

    YYResultModel model = await YYRequestManager.requestPost(url, null);

    if(model.data is Map) {
      PXResultModel px_model = PXResultModel.init(model.data);

      HomeNewMessageModel newMessage = HomeNewMessageModel.fromJson(px_model.result);

      return newMessage;
    } else {
      return HomeNewMessageModel.fromJson({"messageTitle":"123"});
    }
  }

}