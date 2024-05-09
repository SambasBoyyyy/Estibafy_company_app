// To parse this JSON data, do
//
//     final companyJobsModel = companyJobsModelFromJson(jsonString);

import 'dart:convert';

CompanyJobsModel companyJobsModelFromJson(String str) => CompanyJobsModel.fromJson(json.decode(str));

String companyJobsModelToJson(CompanyJobsModel data) => json.encode(data.toJson());

class CompanyJobsModel {
  int? success;
  String? message;
  List<dynamic>? error;
  Data? data;

  CompanyJobsModel({
    this.success,
    this.message,
    this.error,
    this.data,
  });

  factory CompanyJobsModel.fromJson(Map<String, dynamic> json) => CompanyJobsModel(
    success: json["success"],
    message: json["message"],
    error: json["error"] == null ? [] : List<dynamic>.from(json["error"]!.map((x) => x)),
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "error": error == null ? [] : List<dynamic>.from(error!.map((x) => x)),
    "data": data?.toJson(),
  };
}

class Data {
  List<JobData>? complete;
  List<JobData>? inprogress;
  List<JobData>? pending;
  List<JobData>? declined;
  List<JobData>? inreview;
  List<JobData>? accepted;

  Data({
    this.complete,
    this.inprogress,
    this.pending,
    this.declined,
    this.inreview,
    this.accepted,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    complete: json["complete"] == null
        ? []
        : List<JobData>.from(json["complete"].map((x) => JobData.fromJson(x))),
    inprogress: json["inprogress"] == null
        ? []
        : List<JobData>.from(json["inprogress"].map((x) => JobData.fromJson(x))),
    pending: json["pending"] == null
        ? []
        : List<JobData>.from(json["pending"].map((x) => JobData.fromJson(x))),
    declined: json["declined"] == null
        ? []
        : List<JobData>.from(json["declined"].map((x) => JobData.fromJson(x))),
    inreview: json["inreview"] == null
        ? []
        : List<JobData>.from(json["inreview"].map((x) => JobData.fromJson(x))),
    accepted: json["accepted"] == null
        ? []
        : List<JobData>.from(json["accepted"].map((x) => JobData.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "complete": complete == null ? [] : List<dynamic>.from(complete!.map((x) => x)),
    "inprogress": inprogress == null ? [] : List<dynamic>.from(inprogress!.map((x) => x)),
    "pending": pending == null ? [] : List<dynamic>.from(pending!.map((x) => x)),
    "declined": declined == null ? [] : List<dynamic>.from(declined!.map((x) => x)),
    "inreview": inreview == null ? [] : List<dynamic>.from(inreview!.map((x) => x)),
    "accepted": accepted == null ? [] : List<dynamic>.from(accepted!.map((x) => x.toJson())),
  };
}

class JobData {
  int? id;
  int? jobId;
  String? total;
  String? tax;
  String? taxRate;
  String? subTotal;
  String? baseFare;
  int? userId;
  int? companyId;
  int? totalHelpers;
  int? days;
  String? status;
  String? payementMethod;
  String? paymentStatus;
  dynamic paymentDays;
  DateTime? createdAt;
  DateTime? updatedAt;
  Job? job;

  JobData({
    this.id,
    this.jobId,
    this.total,
    this.tax,
    this.taxRate,
    this.subTotal,
    this.baseFare,
    this.userId,
    this.companyId,
    this.totalHelpers,
    this.days,
    this.status,
    this.payementMethod,
    this.paymentStatus,
    this.paymentDays,
    this.createdAt,
    this.updatedAt,
    this.job,
  });

  factory JobData.fromJson(Map<String, dynamic> json) => JobData(
    id: json["id"],
    jobId: json["job_id"],
    total: json["total"],
    tax: json["tax"],
    taxRate: json["tax_rate"],
    subTotal: json["sub_total"],
    baseFare: json["base_fare"],
    userId: json["user_id"],
    companyId: json["company_id"],
    totalHelpers: json["total_helpers"],
    days: json["days"],
    status: json["status"],
    payementMethod: json["payement_method"],
    paymentStatus: json["payment_status"],
    paymentDays: json["payment_days"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    job: json["job"] == null ? null : Job.fromJson(json["job"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "job_id": jobId,
    "total": total,
    "tax": tax,
    "tax_rate": taxRate,
    "sub_total": subTotal,
    "base_fare": baseFare,
    "user_id": userId,
    "company_id": companyId,
    "total_helpers": totalHelpers,
    "days": days,
    "status": status,
    "payement_method": payementMethod,
    "payment_status": paymentStatus,
    "payment_days": paymentDays,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "job": job?.toJson(),
  };
}

class Job {
  int? id;
  String? name;
  String? address;
  int? containerId;
  String? packageType;
  dynamic imageFile;
  dynamic voiceFile;
  DateTime? startTime;
  DateTime? endTime;
  int? userId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic instructions;
  String? latitude;
  String? longitude;
  dynamic approvedBy;
  dynamic jobStatus;
  dynamic jobComment;
  Box? container;
  User? user;
  List<JobHelper>? jobHelpers;

  Job({
    this.id,
    this.name,
    this.address,
    this.containerId,
    this.packageType,
    this.imageFile,
    this.voiceFile,
    this.startTime,
    this.endTime,
    this.userId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.instructions,
    this.latitude,
    this.longitude,
    this.approvedBy,
    this.jobStatus,
    this.jobComment,
    this.container,
    this.user,
    this.jobHelpers,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    containerId: json["container_id"],
    packageType: json["package_type"],
    imageFile: json["image_file"],
    voiceFile: json["voice_file"],
    startTime: json["start_time"] == null ? null : DateTime.parse(json["start_time"]),
    endTime: json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
    userId: json["user_id"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    instructions: json["instructions"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    approvedBy: json["approved_by"],
    jobStatus: json["job_status"],
    jobComment: json["job_comment"],
    container: json["container"] == null ? null : Box.fromJson(json["container"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    jobHelpers: json["job_helpers"] == null ? [] : List<JobHelper>.from(json["job_helpers"]!.map((x) => JobHelper.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "container_id": containerId,
    "package_type": packageType,
    "image_file": imageFile,
    "voice_file": voiceFile,
    "start_time": startTime?.toIso8601String(),
    "end_time": endTime?.toIso8601String(),
    "user_id": userId,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "instructions": instructions,
    "latitude": latitude,
    "longitude": longitude,
    "approved_by": approvedBy,
    "job_status": jobStatus,
    "job_comment": jobComment,
    "container": container?.toJson(),
    "user": user?.toJson(),
    "job_helpers": jobHelpers == null ? [] : List<dynamic>.from(jobHelpers!.map((x) => x.toJson())),
  };
}

class Box {
  int? id;
  String? name;
  int? helperSize;
  String? type;
  int? size;
  int? status;
  dynamic createdAt;
  DateTime? updatedAt;

  Box({
    this.id,
    this.name,
    this.helperSize,
    this.type,
    this.size,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Box.fromJson(Map<String, dynamic> json) => Box(
    id: json["id"],
    name: json["name"],
    helperSize: json["helper_size"],
    type: json["type"],
    size: json["size"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "helper_size": helperSize,
    "type": type,
    "size": size,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class JobHelper {
  int? id;
  int? jobId;
  int? userId;
  int? helperId;
  String? status;
  String? jobCommentStatus;
  dynamic jobCompletionStatus;
  String? approvedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  HelperProfile? helperProfile;

  JobHelper({
    this.id,
    this.jobId,
    this.userId,
    this.helperId,
    this.status,
    this.jobCommentStatus,
    this.jobCompletionStatus,
    this.approvedBy,
    this.createdAt,
    this.updatedAt,
    this.helperProfile,
  });

  factory JobHelper.fromJson(Map<String, dynamic> json) => JobHelper(
    id: json["id"],
    jobId: json["job_id"],
    userId: json["user_id"],
    helperId: json["helper_id"],
    status: json["status"],
    jobCommentStatus: json["job_comment_status"],
    jobCompletionStatus: json["job_completion_status"],
    approvedBy: json["approved_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    helperProfile: json["helper_profile"] == null ? null : HelperProfile.fromJson(json["helper_profile"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "job_id": jobId,
    "user_id": userId,
    "helper_id": helperId,
    "status": status,
    "job_comment_status": jobCommentStatus,
    "job_completion_status": jobCompletionStatus,
    "approved_by": approvedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "helper_profile": helperProfile?.toJson(),
  };
}

class HelperProfile {
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
  dynamic streetAddress;
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

  HelperProfile({
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
  });

  factory HelperProfile.fromJson(Map<String, dynamic> json) => HelperProfile(
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
  };
}
