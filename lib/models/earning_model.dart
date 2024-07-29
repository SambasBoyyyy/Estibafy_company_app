// To parse this JSON data, do
//
//     final earningModel = earningModelFromMap(jsonString);

import 'dart:convert';


class Job {
  final int id;
  final String name;
  final String address;
  final String packageType;
  final String startTime;
  final String endTime;
  final String jobStatus;

  Job({
    required this.id,
    required this.name,
    required this.address,
    required this.packageType,
    required this.startTime,
    required this.endTime,
    required this.jobStatus,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      packageType: json['package_type'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      jobStatus: json['job_status'],
    );
  }
}

class JobData {
  final int id;
  final int companyId;
  final int checkoutId;
  final double totalAmount;
  final double subTotal;
  final double taxAmount;
  final String releaseStatus;
  final String createdAt;
  final String updatedAt;
  final Job job;

  JobData({
    required this.id,
    required this.companyId,
    required this.checkoutId,
    required this.totalAmount,
    required this.subTotal,
    required this.taxAmount,
    required this.releaseStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.job,
  });

  factory JobData.fromJson(Map<String, dynamic> json) {
    return JobData(
      id: json['id'],
      companyId: json['company_id'],
      checkoutId: json['checkout_id'],
      totalAmount: json['total_amount'].toDouble(),
      subTotal: json['sub_total'].toDouble(),
      taxAmount: json['tax_amount'].toDouble(),
      releaseStatus: json['release_status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      job: Job.fromJson(json['job']),
    );
  }
}




class EarningModel {
  EarningModel({
    this.statusCode,
    this.data,
  });

  final int? statusCode;
  final Data? data;

  factory EarningModel.fromJson(String str) => EarningModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EarningModel.fromMap(Map<String, dynamic> json) => EarningModel(
    statusCode: json["status_code"] == null ? null : json["status_code"]!,
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status_code": statusCode == null ? null : statusCode!,
    "data": data == null ? null : data!.toMap(),
  };
}

class Data {
  Data({
    this.releasesPaymentEarning,
    this.unreleasedPaymentEarning,
    this.detailJobsStatus,
  });

  final PaymentEarning? releasesPaymentEarning;
  final PaymentEarning? unreleasedPaymentEarning;
  final List<dynamic>? detailJobsStatus;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    releasesPaymentEarning: json["releases_payment_earning"] == null ? null : PaymentEarning.fromMap(json["releases_payment_earning"]),
    unreleasedPaymentEarning: json["unreleased_payment_earning"] == null ? null : PaymentEarning.fromMap(json["unreleased_payment_earning"]),
    detailJobsStatus: json["detail_jobs_status"] == null ? null : List<dynamic>.from(json["detail_jobs_status"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "releases_payment_earning": releasesPaymentEarning == null ? null : releasesPaymentEarning!.toMap(),
    "unreleased_payment_earning": unreleasedPaymentEarning == null ? null : unreleasedPaymentEarning!.toMap(),
    "detail_jobs_status": detailJobsStatus == null ? null : List<dynamic>.from(detailJobsStatus!.map((x) => x)),
  };
}

class PaymentEarning {
  PaymentEarning({
    this.totalJobsDone,
    this.totalAmount,
    this.totalNumberOfDaysWorked,
  });

  final int? totalJobsDone;
  final double? totalAmount;
  final int? totalNumberOfDaysWorked;

  factory PaymentEarning.fromJson(String str) => PaymentEarning.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentEarning.fromMap(Map<String, dynamic> json) => PaymentEarning(
    totalJobsDone: json["total_jobs_done"] == null ? null : json["total_jobs_done"]!,
    totalAmount: json["total_amount"] == null ? null : json["total_amount"]!,
    totalNumberOfDaysWorked: json["total_number_of_days_worked"] == null ? null : json["total_number_of_days_worked"]!,
  );

  Map<String, dynamic> toMap() => {
    "total_jobs_done": totalJobsDone == null ? null : totalJobsDone!,
    "total_amount": totalAmount == null ? null : totalAmount!,
    "total_number_of_days_worked": totalNumberOfDaysWorked == null ? null : totalNumberOfDaysWorked!,
  };
}
