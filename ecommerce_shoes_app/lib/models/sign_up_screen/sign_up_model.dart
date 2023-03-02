// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    required this.success,
    required this.messege,
    required this.data,
    required this.error,
  });

  final bool success;
  final String messege;
  final List<Datum> data;
  final Error error;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        success: json["success"],
        messege: json["messege"],
        data: List<Datum>.from(
            (json["data"] ?? []).map((x) => Datum.fromJson(x))),
        error: Error.fromJson(json["error"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "messege": messege,
        // "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.email,
    // this.emailVerifiedAt,
    // this.rememberToken,
    // this.image,
    // this.country,
    // this.state,
    // this.city,
    // this.forgotpasswordToken,
    required this.isActive,
    // this.createdAt,
    // this.updatedAt,
  });

  final int id;
  final String name;
  final String email;
  // final dynamic emailVerifiedAt;
  // final dynamic rememberToken;
  // final dynamic image;
  // final dynamic country;
  // final dynamic state;
  // final dynamic city;
  // final dynamic forgotpasswordToken;
  final String isActive;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        // emailVerifiedAt: json["email_verified_at"],
        // rememberToken: json["remember_token"],
        // image: json["image"],
        // country: json["country"],
        // state: json["state"],
        // city: json["city"],
        // forgotpasswordToken: json["forgotpassword_token"],
        isActive: json["is_active"] ?? "",
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "name": name,
  //     "email": email,
  //     // "email_verified_at": emailVerifiedAt,
  //     // "remember_token": rememberToken,
  //     // "image": image,
  //     // "country": country,
  //     // "state": state,
  //     // "city": city,
  //     // "forgotpassword_token": forgotpasswordToken,
  //     "is_active": isActive,
  //     // "created_at": createdAt.toIso8601String(),
  //     // "updated_at": updatedAt.toIso8601String(),
  // };
}

class Error {
  Error({
    required this.email,
  });

  final List<String> email;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        email: List<String>.from((json["email"] ?? []).map((x) => x ?? "")),
      );

  Map<String, dynamic> toJson() => {
        "email": List<dynamic>.from(email.map((x) => x)),
      };
}
