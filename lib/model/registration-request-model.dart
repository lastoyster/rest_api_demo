import 'dart:convert';

class RegistrationRequestModel {
  final String fullName;
  final String gender;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;
  final String deviceId;
  final String firebaseToken;
  final int countryId;
  final int cityId;
  final String postCode;
  final String streetAddressOne;
  final String streetAddressTwo;
  final String invitationCode;
  final String image;

  RegistrationRequestModel({
    required this.fullName,
    required this.gender,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
    required this.deviceId,
    required this.firebaseToken,
    required this.countryId,
    required this.cityId,
    required this.postCode,
    required this.streetAddressOne,
    required this.streetAddressTwo,
    required this.invitationCode,
    required this.image,
  });

  RegistrationRequestModel copyWith({
    String? fullName,
    String? gender,
    String? email,
    String? phoneNumber,
    String? password,
    String? confirmPassword,
    String? deviceId,
    String? firebaseToken,
    int? countryId,
    int? cityId,
    String? postCode,
    String? streetAddressOne,
    String? streetAddressTwo,
    String? invitationCode,
    String? image,
  }) =>
      RegistrationRequestModel(
        fullName: fullName ?? this.fullName,
        gender: gender ?? this.gender,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        deviceId: deviceId ?? this.deviceId,
        firebaseToken: firebaseToken ?? this.firebaseToken,
        countryId: countryId ?? this.countryId,
        cityId: cityId ?? this.cityId,
        postCode: postCode ?? this.postCode,
        streetAddressOne: streetAddressOne ?? this.streetAddressOne,
        streetAddressTwo: streetAddressTwo ?? this.streetAddressTwo,
        invitationCode: invitationCode ?? this.invitationCode,
        image: image ?? this.image,
      );

  factory RegistrationRequestModel.fromRawJson(String str) =>
      RegistrationRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegistrationRequestModel.fromJson(Map<String, dynamic> json) =>
      RegistrationRequestModel(
        fullName: json["fullName"],
        gender: json["gender"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        deviceId: json["deviceId"],
        firebaseToken: json["firebaseToken"],
        countryId: json["countryId"],
        cityId: json["cityId"],
        postCode: json["postCode"],
        streetAddressOne: json["streetAddressOne"],
        streetAddressTwo: json["streetAddressTwo"],
        invitationCode: json["invitationCode"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "gender": gender,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "confirmPassword": confirmPassword,
        "deviceId": deviceId,
        "firebaseToken": firebaseToken,
        "countryId": countryId,
        "cityId": cityId,
        "postCode": postCode,
        "streetAddressOne": streetAddressOne,
        "streetAddressTwo": streetAddressTwo,
        "invitationCode": invitationCode,
        "image": image,
      };
}
