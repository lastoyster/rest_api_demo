import 'dart:convert';

class RegistrationResponseModel {
  final Data data;
  final int code;
  final String message;
  final bool isSuccess;

  RegistrationResponseModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  RegistrationResponseModel copyWith({
    Data? data,
    int? code,
    String? message,
    bool? isSuccess,
  }) =>
      RegistrationResponseModel(
        data: data ?? this.data,
        code: code ?? this.code,
        message: message ?? this.message,
        isSuccess: isSuccess ?? this.isSuccess,
      );

  factory RegistrationResponseModel.fromRawJson(String str) =>
      RegistrationResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegistrationResponseModel.fromJson(Map<String, dynamic> json) =>
      RegistrationResponseModel(
        data: Data.fromJson(json["data"]),
        code: json["code"],
        message: json["message"],
        isSuccess: json["isSuccess"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "code": code,
        "message": message,
        "isSuccess": isSuccess,
      };
}

class Data {
  final User user;

  Data({
    required this.user,
  });

  Data copyWith({
    User? user,
  }) =>
      Data(
        user: user ?? this.user,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  final int memberId;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String country;
  final String city;

  User({
    required this.memberId,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.country,
    required this.city,
  });

  User copyWith({
    int? memberId,
    String? fullName,
    String? phoneNumber,
    String? email,
    String? country,
    String? city,
  }) =>
      User(
        memberId: memberId ?? this.memberId,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        country: country ?? this.country,
        city: city ?? this.city,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        memberId: json["memberId"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        country: json["country"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "memberId": memberId,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "email": email,
        "country": country,
        "city": city,
      };
}
