import 'dart:convert';

class CountryResponseModel {
  final Data data;
  final int code;
  final String message;
  final bool isSuccess;

  CountryResponseModel({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  CountryResponseModel copyWith({
    Data? data,
    int? code,
    String? message,
    bool? isSuccess,
  }) =>
      CountryResponseModel(
        data: data ?? this.data,
        code: code ?? this.code,
        message: message ?? this.message,
        isSuccess: isSuccess ?? this.isSuccess,
      );

  factory CountryResponseModel.fromRawJson(String str) =>
      CountryResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CountryResponseModel.fromJson(Map<String, dynamic> json) =>
      CountryResponseModel(
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
  final List<Country> countries;

  Data({
    required this.countries,
  });

  Data copyWith({
    List<Country>? countries,
  }) =>
      Data(
        countries: countries ?? this.countries,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
      };
}

class Country {
  final int countryId;
  final String countryName;
  final String countryCode;
  final String flagImage;
  final Status status;

  Country({
    required this.countryId,
    required this.countryName,
    required this.countryCode,
    required this.flagImage,
    required this.status,
  });

  Country copyWith({
    int? countryId,
    String? countryName,
    String? countryCode,
    String? flagImage,
    Status? status,
  }) =>
      Country(
        countryId: countryId ?? this.countryId,
        countryName: countryName ?? this.countryName,
        countryCode: countryCode ?? this.countryCode,
        flagImage: flagImage ?? this.flagImage,
        status: status ?? this.status,
      );

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        countryId: json["countryId"],
        countryName: json["countryName"],
        countryCode: json["countryCode"],
        flagImage: json["flagImage"],
        status: statusValues.map[json["status"]]!,
      );

  Map<String, dynamic> toJson() => {
        "countryId": countryId,
        "countryName": countryName,
        "countryCode": countryCode,
        "flagImage": flagImage,
        "status": statusValues.reverse[status],
      };
}

enum Status { ACTIVE }

final statusValues = EnumValues({"Active": Status.ACTIVE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
