// To parse this JSON data, do
//
//     final contractorLogin = contractorLoginFromJson(jsonString);

import 'dart:convert';

ContractorLoginModel contractorLoginFromJson(String str) =>
    ContractorLoginModel.fromJson(json.decode(str));

String contractorLoginToJson(ContractorLoginModel data) =>
    json.encode(data.toJson());

class ContractorLoginModel {
  final bool? status;
  final String? message;
  final User? user;

  ContractorLoginModel({this.status, this.message, this.user});

  factory ContractorLoginModel.fromJson(Map<String, dynamic> json) =>
      ContractorLoginModel(
        status: json["status"],
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "user": user?.toJson(),
  };
}

class User {
  final int? id;
  final String? name;
  final String? mobile;
  final int? mobileVerified;
  final String? email;
  final dynamic emailVerifiedAt;
  final int? role;
  final int? status;
  final dynamic state;
  final dynamic city;
  final dynamic pincode;
  final dynamic address;
  final dynamic religion;
  final dynamic nationality;
  final dynamic citizenship;
  final dynamic dob;
  final dynamic gender;
  final dynamic maritialStatus;
  final dynamic bloodGroup;
  final String? image;
  final dynamic userId;
  final dynamic emergencyName;
  final dynamic emergencyNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? fcmToken;
  final dynamic plantId;
  final int? unitId;
  final int? functionalAreaId;
  final String? responsibility;
  final int? shift;
  final String? version;
  final dynamic designation;
  final dynamic doj;
  final dynamic deviceCode;
  final dynamic employeeCode;
  final dynamic adhar;

  User({
    this.id,
    this.name,
    this.mobile,
    this.mobileVerified,
    this.email,
    this.emailVerifiedAt,
    this.role,
    this.status,
    this.state,
    this.city,
    this.pincode,
    this.address,
    this.religion,
    this.nationality,
    this.citizenship,
    this.dob,
    this.gender,
    this.maritialStatus,
    this.bloodGroup,
    this.image,
    this.userId,
    this.emergencyName,
    this.emergencyNumber,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fcmToken,
    this.plantId,
    this.unitId,
    this.functionalAreaId,
    this.responsibility,
    this.shift,
    this.version,
    this.designation,
    this.doj,
    this.deviceCode,
    this.employeeCode,
    this.adhar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    mobileVerified: json["mobile_verified"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    role: json["role"],
    status: json["status"],
    state: json["state"],
    city: json["city"],
    pincode: json["pincode"],
    address: json["address"],
    religion: json["religion"],
    nationality: json["nationality"],
    citizenship: json["citizenship"],
    dob: json["dob"],
    gender: json["gender"],
    maritialStatus: json["maritial_status"],
    bloodGroup: json["blood_group"],
    image: json["image"],
    userId: json["user_id"],
    emergencyName: json["emergency_name"],
    emergencyNumber: json["emergency_number"],
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    fcmToken: json["fcm_token"],
    plantId: json["plant_id"],
    unitId: json["unit_id"],
    functionalAreaId: json["functional_area_id"],
    responsibility: json["responsibility"],
    shift: json["shift"],
    version: json["version"],
    designation: json["designation"],
    doj: json["doj"],
    deviceCode: json["device_code"],
    employeeCode: json["employee_code"],
    adhar: json["adhar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,
    "mobile_verified": mobileVerified,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "role": role,
    "status": status,
    "state": state,
    "city": city,
    "pincode": pincode,
    "address": address,
    "religion": religion,
    "nationality": nationality,
    "citizenship": citizenship,
    "dob": dob,
    "gender": gender,
    "maritial_status": maritialStatus,
    "blood_group": bloodGroup,
    "image": image,
    "user_id": userId,
    "emergency_name": emergencyName,
    "emergency_number": emergencyNumber,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "fcm_token": fcmToken,
    "plant_id": plantId,
    "unit_id": unitId,
    "functional_area_id": functionalAreaId,
    "responsibility": responsibility,
    "shift": shift,
    "version": version,
    "designation": designation,
    "doj": doj,
    "device_code": deviceCode,
    "employee_code": employeeCode,
    "adhar": adhar,
  };
}
