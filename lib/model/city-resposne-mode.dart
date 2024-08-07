import 'dart:convert';

import 'package:rest_api_demo/model/country-response-model.dart';

class CityResponseModel {
  final Data data;
  final int code;
  final String message;
  final bool isSuccess;

  CityResponseModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  CityResponseModel copyWith({
    Data? data,
    int? code,
    String? message,
    bool? isSuccess,
  }) =>
      CityResponseModel(
        data: data ?? this.data,
        code: code ?? this.code,
        message: message ?? this.message,
        isSuccess: isSuccess ?? this.isSuccess,
      );

  factory CityResponseModel.fromRawJson(String str) =>
      CityResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CityResponseModel.fromJson(Map<String, dynamic> json) =>
      CityResponseModel(
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
  final List<City> cities;

  Data({
    required this.cities,
  });

  Data copyWith({
    List<City>? cities,
  }) =>
      Data(
        cities: cities ?? this.cities,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
      };
}

class City {
  final int cityId;
  final String cityName;
  final String status;
  final Counrty counrty;

  City({
    required this.cityId,
    required this.cityName,
    required this.status,
    required this.counrty, required Country country,
  });

  City copyWith({
    int? cityId,
    String? cityName,
    String? status,
    Counrty? counrty,
  }) =>
      City(
        cityId: cityId ?? this.cityId,
        cityName: cityName ?? this.cityName,
        status: status ?? this.status,
        counrty: counrty ?? this.counrty,
      );

  factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory City.fromJson(Map<String, dynamic> json) => City(
        cityId: json["cityId"],
        cityName: json["cityName"],
        status: json["status"],
        counrty: Counrty.fromJson(json["counrty"]),
      );

  Map<String, dynamic> toJson() => {
        "cityId": cityId,
        "cityName": cityName,
        "status": status,
        "counrty": counrty.toJson(),
      };
}

class Counrty {
  final int countryId;
  final String countryName;
  final String countryCode;
  final String flagImage;
  final String status;

  Counrty({
    required this.countryId,
    required this.countryName,
    required this.countryCode,
    required this.flagImage,
    required this.status,
  });

  Counrty copyWith({
    int? countryId,
    String? countryName,
    String? countryCode,
    String? flagImage,
    String? status,
  }) =>
      Counrty(
        countryId: countryId ?? this.countryId,
        countryName: countryName ?? this.countryName,
        countryCode: countryCode ?? this.countryCode,
        flagImage: flagImage ?? this.flagImage,
        status: status ?? this.status,
      );

  factory Counrty.fromRawJson(String str) => Counrty.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Counrty.fromJson(Map<String, dynamic> json) => Counrty(
        countryId: json["countryId"],
        countryName: json["countryName"],
        countryCode: json["countryCode"],
        flagImage: json["flagImage"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "countryId": countryId,
        "countryName": countryName,
        "countryCode": countryCode,
        "flagImage": flagImage,
        "status": status,
      };
}
