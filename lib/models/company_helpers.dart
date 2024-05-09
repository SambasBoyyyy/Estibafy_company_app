// To parse this JSON data, do
//
//     final helperModel = helperModelFromJson(jsonString);

import 'dart:convert';

HelperModel helperModelFromJson(String str) => HelperModel.fromJson(json.decode(str));

String helperModelToJson(HelperModel data) => json.encode(data.toJson());

class HelperModel {
  int? status;
  dynamic errors;
  List<Helper>? data;

  HelperModel({
    this.status,
    this.errors,
    this.data,
  });

  factory HelperModel.fromJson(Map<String, dynamic> json) => HelperModel(
    status: json["status"],
    errors: json["errors"],
    data: json["data"] == null ? [] : List<Helper>.from(json["data"]!.map((x) => Helper.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "errors": errors,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Helper {
  int? id;
  String? name;
  String? email;
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
  String? streetAddress;
  double? longitude;
  String? approved;
  dynamic approvedBy;
  dynamic govermentId;
  dynamic fcmToken;
  int? isVerified;
  String? apartment;
  String? city;
  String? province;
  String? country;
  int? companyId;
  String? imagePath;
  bool selectedForAssign;

  Helper({
    this.id,
    this.name,
    this.email,
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
    this.streetAddress,
    this.longitude,
    this.approved,
    this.approvedBy,
    this.govermentId,
    this.fcmToken,
    this.isVerified,
    this.apartment,
    this.city,
    this.province,
    this.country,
    this.companyId,
    this.imagePath,
    this.selectedForAssign = false,
  });

  factory Helper.fromJson(Map<String, dynamic> json) => Helper(
    id: json["id"],
    name: json["name"],
    email: json["email"],
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
    streetAddress: json["street_address"],
    longitude: json["longitude"]?.toDouble(),
    approved: json["approved"],
    approvedBy: json["approved_by"],
    govermentId: json["goverment_id"],
    fcmToken: json["fcm_token"],
    isVerified: json["isVerified"],
    apartment: json["apartment"],
    city: json["city"],
    province: json["province"],
    country: json["country"],
    companyId: json["company_id"],
    imagePath: json["imagePath"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
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
    "street_address": streetAddress,
    "longitude": longitude,
    "approved": approved,
    "approved_by": approvedBy,
    "goverment_id": govermentId,
    "fcm_token": fcmToken,
    "isVerified": isVerified,
    "apartment": apartment,
    "city": city,
    "province": province,
    "country": country,
    "company_id": companyId,
    "imagePath": imagePath,
  };
}
