class SignUpModel {
  String? name;
  String? email;
  List?  password;
  String? gender;
  String? age;
  bool? success;
  String? message;
  bool? termsAndConditions;
  String? accessToken;
  String? refreshToken;

  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.age,
    required this.success,
    required this.message,
    this.termsAndConditions = true,
    required this.refreshToken,
    required this.accessToken
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      termsAndConditions: json['tnc'],
      gender: json['gender'],
      age: json['age'],
      success: json['success'],
      message: json['message'],
      refreshToken: json['access_token'],
      accessToken: json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'refresh_token':refreshToken,
      'access_token' : accessToken,
      'password': password,
      'gender': gender,
      'age': age,
      'tnc': termsAndConditions,
      'success': success,
      'message': message
    };
  }
}
