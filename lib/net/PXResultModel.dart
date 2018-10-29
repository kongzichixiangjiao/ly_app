
class PXResultModel {
  String message;
  var result;
  int returnCode;
  String token;

  PXResultModel(this.message, this.result, this.returnCode, this.token);

  static PXResultModel init(Map json) {
    return PXResultModel(json["message"], json["result"], json["returnCode"], json["token"]);
  }
}