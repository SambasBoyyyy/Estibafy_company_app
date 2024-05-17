// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? status;
  String? message;
  dynamic errors;
  Data? data;

  UserModel({
    this.status,
    this.message,
    this.errors,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    message: json["message"],
    errors: json["errors"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "errors": errors,
    "data": data?.toJson(),
  };
}

class Data {
  Token? token;
  User? user;

  Data({
    this.token,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"] =Token.fromJson(json["token"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token?.toJson(),
    "user": user?.toJson(),
  };
}

class Token {
  String? accessToken;
  String? tokenType;

  Token({
    this.accessToken,
    this.tokenType,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
  };
}

class User {
  int? id;
  String? name;
  String? email;
  int? userType;
  String? mobile;
  String? image;
  String? accessToken;
  dynamic emailVerifiedAt;
  int? status;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? latitude;
  double? longitude;
  dynamic fcmToken;
  int? isVerified;
  dynamic paymentDays;
  Company? company;
  String? profilePath;

  User({
    this.id,
    this.name,
    this.email,
    this.userType,
    this.mobile,
    this.image,
    this.accessToken,
    this.emailVerifiedAt,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.latitude,
    this.longitude,
    this.fcmToken,
    this.isVerified,
    this.paymentDays,
    this.company,
    this.profilePath,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    userType: json["user_type"],
    mobile: json["mobile"],
    image: json["image"],
    accessToken: json["access_token"],
    emailVerifiedAt: json["email_verified_at"],
    status: json["status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    fcmToken: json["fcm_token"],
    isVerified: json["isVerified"],
    paymentDays: json["payment_days"],
    company: json["company"] == null ? null : Company.fromJson(json["company"]),
    profilePath: json["profile_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "user_type": userType,
    "mobile": mobile,
    "image": image,
    "access_token": accessToken,
    "email_verified_at": emailVerifiedAt,
    "status": status,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "latitude": latitude,
    "longitude": longitude,
    "fcm_token": fcmToken,
    "isVerified": isVerified,
    "payment_days": paymentDays,
    "company": company?.toJson(),
    "profile_path": profilePath,
  };
}

class Company {
  int? id;
  dynamic title;
  dynamic web;
  dynamic description;
  int? userId;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? companyName;
  String? companyMobile;
  String? companyAddress;
  String? ruc;
  DateTime? createdAt;
  DateTime? updatedAt;

  Company({
    this.id,
    this.title,
    this.web,
    this.description,
    this.userId,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.companyName,
    this.companyMobile,
    this.companyAddress,
    this.ruc,
    this.createdAt,
    this.updatedAt,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"],
    title: json["title"],
    web: json["web"],
    description: json["description"],
    userId: json["user_id"],
    status: json["status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    companyName: json["company_name"],
    companyMobile: json["company_mobile"],
    companyAddress: json["company_address"],
    ruc: json["ruc"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "web": web,
    "description": description,
    "user_id": userId,
    "status": status,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "company_name": companyName,
    "company_mobile": companyMobile,
    "company_address": companyAddress,
    "ruc": ruc,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
