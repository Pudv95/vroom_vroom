class ForgotPasswordModel {
  String? forgotPasswordToken;
  String? msg;
  bool? success;

  ForgotPasswordModel(
      {this.forgotPasswordToken,
        this.msg,
        this.success});

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    forgotPasswordToken = json['token'];
    msg = json['msg'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['token'] = forgotPasswordToken;
    data['msg'] = msg;
    data['success'] = success;
    return data;
  }
}