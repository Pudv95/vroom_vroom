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
  String? number;

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
    required this.accessToken,
    required this.number
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      number: json['number'],
      termsAndConditions: json['tnc'],
      gender: json['gender'],
      age: json['age'],
      success: json['success'],
      message: json['message'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
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
      'number':number,
      'tnc': termsAndConditions,
      'success': success,
      'message': message
    };
  }
}
