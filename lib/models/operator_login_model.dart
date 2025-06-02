class OperatorLoginModel {
  final bool status;
  final String message;
  final OperatorData? operator;
  final String? authCode;

  OperatorLoginModel({
    required this.status,
    required this.message,
    this.operator,
    this.authCode,
  });

  factory OperatorLoginModel.fromJson(Map<String, dynamic> json) {
    return OperatorLoginModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      operator: json['operator'] != null
          ? OperatorData.fromJson(json['operator'])
          : null,
      authCode: json['auth_code'],
    );
  }
}

class OperatorData {
  final int? id;
  final String? name;
  final String? mobile;
  final int? mobileVerified;
  final String? email;
  final String? emailVerifiedAt;
  final int? role;
  final int? status;
  final String? state;
  final String? city;
  final int? pincode;
  final String? address;
  final String? religion;
  final String? nationality;
  final String? citizenship;
  final String? dob;
  final String? gender;
  final String? maritialStatus;
  final String? bloodGroup;
  final String? image;
  final int? userId;
  final String? emergencyName;
  final String? emergencyNumber;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? fcmToken;
  final int? plantId;
  final int? unitId;
  final int? functionalAreaId;
  final String? responsibility;
  final String? shift;
  final String? version;
  final String? designation;
  final String? doj;
  final String? deviceCode;
  final String? employeeCode;
  final String? adhar;

  OperatorData({
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

  factory OperatorData.fromJson(Map<String, dynamic> json) {
    return OperatorData(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      mobileVerified: json['mobile_verified'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      role: json['role'],
      status: json['status'],
      state: json['state'],
      city: json['city'],
      pincode: json['pincode'],
      address: json['address'],
      religion: json['religion'],
      nationality: json['nationality'],
      citizenship: json['citizenship'],
      dob: json['dob'],
      gender: json['gender'],
      maritialStatus: json['maritial_status'],
      bloodGroup: json['blood_group'],
      image: json['image'],
      userId: json['user_id'],
      emergencyName: json['emergency_name'],
      emergencyNumber: json['emergency_number'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      fcmToken: json['fcm_token'],
      plantId: json['plant_id'],
      unitId: json['unit_id'],
      functionalAreaId: json['functional_area_id'],
      responsibility: json['responsibility'],
      shift: json['shift'],
      version: json['version'],
      designation: json['designation'],
      doj: json['doj'],
      deviceCode: json['device_code'],
      employeeCode: json['employee_code'],
      adhar: json['adhar'],
    );
  }
}
