import 'dart:convert';

SignInDataModel signInDataFromJson(String str) =>
    SignInDataModel.fromJson(json.decode(str));

// String signInDataToJson(SignInDataModel data) => json.encode(data.toJson());

class SignInDataModel {
  SignInDataModel({
    required this.success,
    required this.messege,
    required this.data,
    required this.error,
  });

  bool success;
  String messege;
  Data data;
  String error;

  factory SignInDataModel.fromJson(Map<String, dynamic> json) => SignInDataModel(
        success: json["success"],
        messege: json["messege"] ?? "",
        data: Data.fromJson(json["data"]),
        error: json["error"] ?? "",
      );

  // Map<String, dynamic> toJson() => {
  //       "success": success,
  //       "messege": messege,
  //       "data": data.toJson(),
  //     };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.password,
    required this.rememberToken,
    required this.image,
    required this.country,
    required this.state,
    required this.city,
    required this.forgotpasswordToken,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String emailVerifiedAt;
  String password;
  String rememberToken;
  String image;
  int country;
  int state;
  int city;
  String forgotpasswordToken;
  String createdAt;
  String updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        emailVerifiedAt: json["email_verified_at"] ?? "",
        password: json["password"] ?? "",
        rememberToken: json["remember_token"] ?? "",
        image: json["image"] ?? "",
        country: json["country"] ?? 0,
        state: json["state"] ?? 0,
        city: json["city"] ?? 0,
        forgotpasswordToken: json["forgotpassword_token"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "password": password,
        "remember_token": rememberToken,
        "image": image,
        "country": country,
        "state": state,
        "city": city,
        "forgotpassword_token": forgotpasswordToken,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
