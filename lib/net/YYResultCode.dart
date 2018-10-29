import 'package:event_bus/event_bus.dart';

class YYResultCode {
  ///网络错误
  static const NETWORK_ERROR = -1;

  ///网络超时
  static const NETWORK_TIMEOUT = -2;

  ///网络返回数据格式化一次
  static const NETWORK_JSON_EXCEPTION = -3;

  static const SUCCESS = 200;

  static final EventBus eventBus = new EventBus();

  static errorHandleFunction(code, message, noTip) {
    if(noTip) {
      return message;
    }
    eventBus.fire(new YYResultErrorEvent(code, message));
    return message;
  }
}

class YYResultErrorEvent {
  final int code;

  final String message;

  YYResultErrorEvent(this.code, this.message);
}
