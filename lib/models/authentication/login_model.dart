class LoginUserModel {
  String? accessToken;
  String? refreshToken;
  String? email;
  String? msg;
  bool? success;

  LoginUserModel(
      {this.accessToken,
        this.refreshToken,
        this.email,
        this.msg,
        this.success});

  LoginUserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    email = json['email'];
    msg = json['msg'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['email'] = email;
    data['msg'] = msg;
    data['success'] = success;
    return data;
  }
}