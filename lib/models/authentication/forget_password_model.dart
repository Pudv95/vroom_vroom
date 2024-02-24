class ForgotPasswordModel {
  String? forgotPasswordToken;
  String? msg;
  String? otp;
  bool? success;

  ForgotPasswordModel(
      {this.forgotPasswordToken,
        this.msg,
        this.otp,
        this.success});

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    forgotPasswordToken = json['token'];
    msg = json['msg'];
    otp = json['otp'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['token'] = forgotPasswordToken;
    data['msg'] = msg;
    data['otp'] = otp;
    data['success'] = success;
    return data;
  }
}